const express = require('express');
// const db = require('./db');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

/*
    Note:
    Yang tidak memiliki label 'Static', menggunakan file ejs karena konten dinamis.

    Static menggunakan fungsi res.sendFile(), 
    Dinamis menggunakan res.render();
    
        - Erik
*/

// Landing Page (Static)
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

// Form Pengajuan Konsultasi (Static) -> /proses
app.get('/pengajuan', (req, res) => {
    res.sendFile(path.join(__dirname, "public", "pengajuan.html"));
});

// Proses Pengajuan -> /proses/transaksi
app.post('/proses', (req, res) => {
    res.redirect('/jadwal');
});

// Transaksi END
app.post('/proses/transaksi', (req, res) => {
    res.end();
});

// Jadwal - yang tersedia bagi user
app.get('/jadwal', (req, res) => {
    res.end();
});

// List Jadwal Dokter
app.get('/jadwal/dokter', (req, res) => {
    res.end();
});

// Tabel list jadwal dengan CRUD dashboard
app.get('/admin', (req, res) => {
    res.end();
});

// Update/Delete
app.get('/admin/jadwal/:id', (req, res) => {
    res.end();
});

// Request POST, PUT, DELETE coming soon...

app.listen(port, () => {
    console.log(`Server berhasil berjalan di http://localhost:${port}`);
});