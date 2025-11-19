# Aplikasi Cuaca (Weather App)

**Nama:** Joy Melvin 

**Proyek:** Weather App

Aplikasi Flutter sederhana yang menampilkan data cuaca statis (dummy)

---

### 📸 Tampilan Aplikasi

| Tampilan Ponsel (ListView) 
| :---: |
| (<img width="364" height="772" alt="image" src="https://github.com/user-attachments/assets/098195fb-8143-4956-b1b8-41b39a671939" />

---

### ✅ Pemenuhan Kriteria Tugas

# Refleksi Pengerjaan: Weather App with Multi-Page Navigation

Berikut adalah refleksi saya selama proses pembuatan fitur navigasi pada aplikasi ini:

## 1. Memastikan Alur Navigasi yang Efisien dan Mudah Dipahami

Untuk membuat perpindahan halaman terasa natural dan tidak membingungkan, saya menggunakan pola yang umum dipakai di aplikasi modern, yaitu kombinasi **Bottom Navigation Bar** dan **Navigasi Langsung (Push)**.

- **Bottom Navigation Bar:** Saya menaruh menu utama seperti 'Home' dan 'Profile' di bagian bawah layar. Ini adalah area yang paling mudah dijangkau oleh jempol. Dengan ini, pengguna bisa berpindah dari melihat cuaca ke menu profil hanya dengan satu kali klik tanpa kehilangan posisi scroll mereka.

- **Navigasi Halaman Detail:** Untuk melihat detail kota, saya tidak menaruhnya di menu bawah, tapi membuatnya bisa diakses langsung dengan menekan kartu kota (tap to view). Ini memberikan alur yang jelas: Halaman Utama untuk ringkasan, dan Halaman Detail untuk info lengkap. Adanya tombol 'Kembali' (Back) di pojok kiri atas juga memastikan pengguna tidak tersesat dan bisa kembali ke daftar kota dengan mudah.

## 2. Mengelola Data Antar Halaman (Data Passing)

Tantangan utamanya adalah bagaimana menampilkan data spesifik (misalnya suhu Bandung) di halaman detail tanpa harus memanggil ulang data atau membuat kode yang berulang-ulang. Solusi yang saya pakai adalah teknik **Passing Arguments via Constructor**.

- **Pendekatan:** Saya membuat `DetailScreen` wajib menerima sebuah paket data (`WeatherModel`) saat pertama kali dibuka.

- **Implementasi:** Saat pengguna menekan kartu kota di Home Screen, saya menggunakan perintah `Navigator.push` sambil "menitipkan" data kota tersebut langsung ke `DetailScreen`.

- **Manfaat:** Dengan cara ini, `DetailScreen` jadi sangat fleksibel. Dia tidak perlu tahu dari mana asalnya data; tugasnya cuma menampilkan apa yang dikasih. Ini membuat kode jadi jauh lebih ringkas karena saya tidak perlu membuat halaman terpisah untuk setiap kota (tidak perlu ada `BandungScreen`, `JakartaScreen`, dll), cukup satu `DetailScreen` yang bisa berubah-ubah isinya.

## 3. Pelajaran tentang Struktur Navigasi dan Modularisasi

Pelajaran paling penting yang saya dapat adalah bahwa **navigasi bukan cuma soal perintah pindah layar, tapi soal menata struktur aplikasi**.

Awalnya saya kira navigasi cuma sekadar `Navigator.push`. Tapi ternyata, memisahkan kerangka utama navigasi (seperti `MainWrapper` yang memegang tombol bawah) dari isi halaman (`HomeScreen`, `ProfileScreen`) itu sangat penting. Ini mengajarkan saya prinsip **Satu Tugas untuk Satu Widget**: biarkan `MainWrapper` yang mengatur navigasi global, dan biarkan setiap halaman fokus pada isinya sendiri. Memecah-mecah kode (modularisasi)—seperti memisahkan widget kecil dan halaman—membuat kode saya jadi jauh lebih rapi, gampang dibaca, dan aman kalau mau ditambah fitur baru nanti.
