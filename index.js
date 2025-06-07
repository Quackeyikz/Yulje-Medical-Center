const express = require('express');
// const db = require('./db');
const fs = require('fs');
const path = require('path');

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
    res.render("pengajuan.ejs");
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