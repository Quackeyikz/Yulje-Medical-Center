const express = require('express');
const db = require('./db');
const fs = require('fs');
const path = require('path');
const { renderFile } = require('ejs');

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));  // Untuk pemanggilan asset tanpa root folder
app.set("view engine", "ejs");

/*
    Note:
    Menggunakan file ejs karena konten dinamis dan telah support modularity.
    Dinamis menggunakan res.render() dengan source direktori 'views/'
    
        - Erik
*/

// Landing Page
app.get('/', (req, res) => {
    res.render("index.ejs");
});

// Form Pengajuan Konsultasi -> /proses
app.get('/pengajuan', (req, res) => {
    res.render("pengajuan-1-form.ejs", { error_msg: 0, data: req.body });
});

// Proses Pengajuan -> /proses/transaksi
app.post('/proses', (req, res) => {
    db.query('SELECT * FROM dokter d JOIN spesialis s ON d.id_spesialis=s.id_spesialis JOIN jadwal_praktik p ON d.id_praktik=p.id_praktik', (err, results) => {
        if(err) throw err;

        const reqHari = req.body.tgl_konsultasi;
        const reqWaktu = req.body.jam_konsultasi;

        const dokter_tersedia = results.filter(row => {
            const hariCocok = row.hari === new Date(reqHari).toLocaleDateString('id-ID', { weekday: 'long' });
            const waktuCocok = row.waktu_mulai <= reqWaktu && reqWaktu <= row.waktu_selesai;

            return hariCocok && waktuCocok;
        });

        let dokter_ditugaskan = '';

        if (dokter_tersedia.length > 0) {
            // Menugaskan dokter pertama yang available
            dokter_ditugaskan = dokter_tersedia[0];
        } else {
            return res.render('pengajuan-1-form.ejs', { 
                error_msg: 1,
                data: req.body
            });
        }

        // nama hanya untuk display, id dan biaya untuk passing data
        res.render("pengajuan-2-preview.ejs", { 
            data: req.body,
            id_dokter: dokter_ditugaskan.id_dokter,
            nama_dokter: dokter_ditugaskan.nama_dokter,
            biaya: dokter_ditugaskan.biaya
        });
    });
});

// Transaksi
app.post('/proses/transaksi', (req, res) => {
    const formData = req.body;

    const pasien_insert = `INSERT INTO pasien (nama_pasien, jenis_kelamin, tanggal_lahir, kontak, alamat) VALUES (?, ?, ?, ?, ?)`;
    const pasien_values = [ formData.nama, formData.jk, formData.tanggal_lahir, formData.kontak, formData.alamat ];

    db.query(pasien_insert, pasien_values, (err, results) => {
        if(err) throw err;

        // id pasien menggunakan ID yang baru dibuat
        const id_pasien = results.insertId;
        const konsul_insert = `INSERT INTO jadwal_konsultasi (id_pasien, id_dokter, tanggal, waktu, keluhan, status) VALUES (?, ?, ?, ?, ?, ?)`;
        const konsul_values = [ id_pasien, formData.id_dokter, formData.tgl_konsultasi, formData.jam_konsultasi, formData.keluhan, 'Terjadwal' ];

        db.query(konsul_insert, konsul_values, (err, results) => {
            if(err) throw err;

            res.render("pengajuan-3-payment.ejs", { 
                data: req.body,
                id_konsultasi: results.insertId,
                id_pasien
            });
        });
    });
});

// Antrian
app.post('/proses/antrian', (req, res) => {
    const formData = req.body;

    const transaksi_insert = `INSERT INTO transaksi (id_konsultasi, nominal, metode_bayar, tanggal_transaksi, waktu_transaksi, status) VALUES (?, ?, ?, ?, ?, ?)`;
    const now = new Date();
    const tanggal_transaksi = now.toISOString().slice(0, 10); // YYYY-MM-DD
    const waktu_transaksi = now.toTimeString().slice(0, 8);   // HH:MM:SS

    const transaksi_values = [
        formData.id_konsultasi,
        formData.biaya,
        'Bank',
        tanggal_transaksi,
        waktu_transaksi,
        'Sukses'
    ];

    db.query(transaksi_insert, transaksi_values, (err, results) => {
        if(err) throw err;
    });

    const antrian_fetch = `SELECT * FROM jadwal_konsultasi k JOIN pasien p ON k.id_pasien=p.id_pasien JOIN dokter d ON d.id_dokter=k.id_dokter JOIN spesialis s ON d.id_spesialis=s.id_spesialis JOIN transaksi t ON k.id_konsultasi=t.id_konsultasi WHERE p.id_pasien = ?`;

    db.query(antrian_fetch, [formData.id_pasien], (err, results) => {
        if(err) throw err;

        console.log(results);
        res.render("pengajuan-4-antrian.ejs", { data: results[0] });
    });
});

// Jadwal - yang tersedia bagi user
app.get('/jadwal', (req, res) => {
    res.render("jadwal.ejs");
});

app.post('/jadwal/antrian', (req, res) => {
    const formData = req.body;
    const nama = formData.nama;

    const sql = `SELECT * FROM jadwal_konsultasi k JOIN pasien p ON k.id_pasien=p.id_pasien JOIN dokter d ON d.id_dokter=k.id_dokter JOIN spesialis s ON d.id_spesialis=s.id_spesialis JOIN transaksi t ON k.id_konsultasi=t.id_konsultasi WHERE LOWER(p.nama_pasien) LIKE ? AND p.tanggal_lahir = ?`;
    const sql_values = [ `%${nama.toLowerCase()}%`, formData.tgl_lahir ];

    db.query(sql, sql_values, (err, results) => {
        if (err) throw err;

        console.log(results);

        if (!results || results.length === 0) {
            return res.status(404).send('Data tidak ditemukan.');
        }

        res.render('jadwal-antrian.ejs', { data: results[0] });
    });
});

// List Jadwal Dokter
app.get('/jadwal/dokter', (req, res) => {
    const sql_dokter = `SELECT * FROM dokter d JOIN spesialis s ON d.id_spesialis=s.id_spesialis JOIN jadwal_praktik p ON d.id_praktik = p.id_praktik`;

    db.query(sql_dokter, (err, results) => {
        if(err) throw err;
        res.render("jadwal-dokter.ejs", { results });
    });
});

// Tabel list jadwal dengan CRUD dashboard
app.get('/admin', (req, res) => {
    // Sort by date?
    const jadwal_konsultasi = `SELECT DISTINCT * FROM jadwal_konsultasi k JOIN pasien p ON k.id_pasien=p.id_pasien JOIN dokter d ON d.id_dokter=k.id_dokter JOIN spesialis s ON d.id_spesialis=s.id_spesialis JOIN jadwal_praktik jp ON d.id_praktik=jp.id_praktik ORDER BY k.tanggal ASC`;

    db.query(jadwal_konsultasi, (err, results) => {
        if(err) throw err;
        res.render("admin.ejs", { results });
    });
});

// Update
app.get('/admin/jadwal/:id', (req, res) => {
    const target = req.params.id;
    const jadwal_sql = `SELECT * FROM jadwal_konsultasi k JOIN pasien p ON k.id_pasien=p.id_pasien JOIN dokter d ON k.id_dokter=d.id_dokter WHERE k.id_pasien = ?`;
    
    db.query(jadwal_sql, [target], (err, results) => {
        if(err) throw err;
        res.render("admin-edit.ejs", { data: results[0] });
    });
});

app.post('/admin/jadwal/:id/edit', (req, res) => {
    const formData = req.body;
    const target = req.params.id;

    const update_sql = `UPDATE jadwal_konsultasi SET id_pasien = ?, id_dokter = ?, tanggal = ?, waktu = ?, keluhan = ?, status = ? WHERE id_konsultasi = ?`;
    const update_values = [ formData.id_pasien, formData.id_dokter, formData.tanggal, formData.waktu, formData.keluhan, formData.status, target ];

    db.query(update_sql, update_values, (err, results) => {
        if (err) throw err;
        res.redirect('/admin');
    });
});

// Delete
app.get('/admin/jadwal/:id/delete', (req, res) => {
    const target = req.params.id;

    const hapus_transaksi = `DELETE FROM transaksi WHERE id_konsultasi = ?`;
    db.query(hapus_transaksi, [target], (err) => {
        if(err) throw err;
    });

    const delete_sql = `DELETE FROM jadwal_konsultasi WHERE id_konsultasi = ?`;
    db.query(delete_sql, [target], (err, results) => {
        if(err) throw err;
        res.redirect("/admin");
    });
});

// Mark as done (Masuk ke riwayat konsultasi)
app.get('/admin/jadwal/:id/done', (req, res) => {
    const target = req.params.id;

    // Ambil data dari jadwal_konsultasi berdasarkan id
    const done_sql = `SELECT * FROM jadwal_konsultasi WHERE id_konsultasi = ?`;

    db.query(done_sql, [target], (err, results) => {
        if (err) throw err;
        if (results.length === 0) return res.redirect('/admin');

        const row = results[0];

        const insert_sql = `
            INSERT INTO riwayat_konsultasi (id_pasien, id_dokter, tanggal, waktu, keluhan, status, diagnosis, tindakan)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const insert_values = [
            row.id_pasien,
            row.id_dokter,
            row.tanggal,
            row.waktu,
            row.keluhan,
            'Selesai',
            '',
            ''
        ];

        db.query(insert_sql, insert_values, (err, results) => {
            if (err) throw err;

            // Menghapus refering transaksi untuk menghapus jadwal_konsultasi
            const hapus_transaksi = `DELETE FROM transaksi WHERE id_konsultasi = ?`;

            db.query(hapus_transaksi, [target], (err) => {
                if(err) throw err;
            });

            // Hapus dari jadwal_konsultasi setelah dipindahkan ke riwayat
            const delete_sql = `DELETE FROM jadwal_konsultasi WHERE id_konsultasi = ?`;

            db.query(delete_sql, [target], (err) => {
                if (err) throw err;
                res.redirect('/admin/riwayat');
            });
        });
    });
});

app.get('/admin/riwayat', (req, res) => {
    db.query('SELECT * FROM riwayat_konsultasi ORDER BY tanggal DESC', (err, results) => {
        if(err) throw err;
        res.render("admin-riwayat.ejs", { results });
    });
});

// I'm kinda tired of writing SQL Queries this much. ugh
app.listen(port, () => {
    console.log(`Server berhasil berjalan di http://localhost:${port}`);
});