# "YULJE Medical Center" - CRUD Jadwal Konsultasi Dokter dan Pasien
_Web App - Tugas Akhir Pemrograman Web_
_Disclaimer: Nama dan inspirasi hanya berupa objek fiktif belaka_

**Deskripsi**
Projek aplikasi ini bertujuan untuk mengaplikasikan *study case* jadwal konsultasi antara dokter dengan pasien. Program menyajikan informasi mengenai penjadwalan yang telah dipesan oleh pasien dan status dari jadwal tersebut, mulai dari tanggal, deskripsi, status, dan lain-lain.

**Flow Utama**
- Mengisi data diri pasien.
- Mengisi jadwal konsultasi tanggal, jam, spesialis, keluhan (dokter diassign oleh sistem).
- Jika berhasil, mengarah ke pembayaran/transaksi.
- Jika gagal, kembali ke halaman input konsultasi.

## Teknologi
- Framework Bootstrap 5
- HTML5
- CSS3
- NodeJS
- ExpressJS
- MySQL (PhpMyAdmin)

**Packages Installed**
- mysql2
- express

**Routes / Endpoints**
- http://localhost:3000/
- http://localhost:3000/pengajuan
- http://localhost:3000/proses
- http://localhost:3000/jadwal
- http://localhost:3000/jadwal/dokter

## Database Tables
- **Jadwal_Konsultasi**
  - *id_konsultasi* INT/SERIAL AUTO_INCREMENT(P)
  - *id_pasien* VARCHAR(50) (F)
  - *id_dokter* VARCHAR(50) (F)
  - *tanggal* DATE
  - *waktu* TIME
  - *keluhan* TEXT/VARCHAR(255)
  - *status* VARCHAR(30)
  
- **Riwayat_Konsultasi**
  - *id_riwayat* INT/SERIAL AUTO_INCREMENT(P)
  - *id_pasien* VARCHAR(50) (F)
  - *id_dokter* VARCHAR(50) (F)
  - *tanggal* DATE
  - *waktu* TIME
  - *keluhan* TEXT/VARCHAR(255)
  - *status* VARCHAR(30)
  - *diagnosis* VARCHAR(255)
  - *tindakan* VARCHAR(255)
  
- **Dokter**
  - *id_dokter* INT/SERIAL AUTO_INCREMENT(P)
  - *nama_dokter* VARCHAR(50)
  - *spesialis* VARCHAR(50)
  - *kontak* VARCHAR(30)
  - *id_praktik* VARCHAR(100) (F)
  
- **Jadwal_Praktik**
  - *id_praktik* INT/SERIAL AUTO_INCREMENT(P)
  - *hari* VARCHAR(10)
  - *waktu_mulai* TIME
  - *waktu_selesai* TIME
  
- **Pasien**
  - *id_pasien* INT/SERIAL AUTO_INCREMENT(P)
  - *nama_pasien* VARCHAR(50)
  - *jenis_kelamin* VARCHAR(10)
  - *tanggal_lahir* DATE
  - *kontak* VARCHAR(30)
  - *alamat* VARCHAR(255)
  
- **Transaksi**
  - *id_transaksi* INT/SERIAL AUTO_INCREMENT(P)
  - *id_konsultasi* INT/SERIAL (F)
  - *nominal* NUMERIC/INT/DECIMAL
  - *metode_bayar* VARCHAR(30)
  - *tanggal_transaksi* DATE
  - *waktu_transaksi* TIME
  - *status* VARCHAR(30)

##### Struktur Direktori Projek
yulje-app/  
├─ database/  
├─ node_modules/  
├─ public/  
│  ├─ css/  
│  ├─ img/  
│  ├─ schemas/  
│  ├─ index.html  
├─ db.js  
├─ index.js  
├─ package-lock.json  
├─ package.json  
├─ README.md  
  

### FAQ Frequently Asked Questions
Q: Bagaimana cara menjalankan aplikasi?
A: Berikut adalah penjelasan singkat:
1. **Copy repository** ini; 
2. Buka **PhpMyAdmin > Import** (atau http://localhost/phpmyadmin/index.php?route=/server/import);
3. **Copy** isi file [`database/yulje_pw.sql`](database/yulje_pw.sql) lalu paste.
4. **Run** / jalankan script SQL-nya untuk membuat database beserta tabel-tabelnya. *Note: isi tabel kosong.*
5. Buka folder projek, lalu jalankan `node index.js`. Pastikan untuk memeriksa konfigurasi db.js terkait user dan password database.
6. Buka browser, lalu akses alamat http://localhost:3000.

Q: Apakah aplikasi ini Open Source?
A: Tidak, source-code aplikasi ini hanya dapat digunakan untuk penggunaan pribadi dan tidak diperkenankan untuk mengganti kepemilikan asli.