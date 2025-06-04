const express = require('express');
// const db = require('./db');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.get('/pengajuan', (req, res) => {
    res.end();
});

app.post('/proses', (req, res) => {
    res.end();
});

app.get('/jadwal', (req, res) => {
    res.end();
});

app.listen(port, () => {
    console.log(`Server berhasil berjalan di http://localhost:${port}`);
});