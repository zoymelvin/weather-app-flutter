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

Berikut adalah bagaimana proyek ini memenuhi semua kriteria tugas yang diberikan:

* **1. Tampilkan Daftar Kota (Data Dummy)**
    * Aplikasi berhasil menampilkan daftar kota beserta suhu dan kondisinya.
    * Data yang digunakan bersifat statis (dummy) dan diambil dari file `lib/data/dummy_weather_data.dart`. Tidak ada panggilan API eksternal.

* **2. Desain UI Adaptif (ListView vs GridView)**
    * UI dirancang untuk adaptif terhadap ukuran layar.
    * Pada layar kecil (lebar **≤ 600px**), daftar "Kota lain" akan ditampilkan menggunakan **`ListView`**.
    * Pada layar besar (lebar **> 600px**), daftar tersebut akan otomatis beralih menggunakan **`GridView`** dengan 2 kolom.
    * Logika adaptif ini diimplementasikan di dalam widget `_OtherCitiesList` pada file `lib/screens/home_screen.dart` menggunakan `LayoutBuilder`.

* **3. Elemen Visual & Desain Rapi**
    * Aplikasi memiliki tampilan yang bersih dengan skema warna gelap yang konsisten, diatur secara terpusat di `main.dart` dan `lib/utils/app_colors.dart`.
    * Ikon cuaca (emoji) disertakan untuk setiap kondisi cuaca pada kartu utama dan daftar kota.
    * Layout dijaga agar tetap rapi dengan `Padding` dan `SizedBox` yang konsisten.

* **4. Tidak Ada Kodingan Redundant**
    * Untuk memastikan kode bersih dan mudah dirawat, file `home_screen.dart` di-refactor dengan memecah UI menjadi widget-widget privat yang lebih kecil (spt `_Header`, `_CurrentWeatherCard`, `_SectionTitle`, dll.).
    * Pendekatan ini menerapkan *Single Responsibility Principle (SRP)*, di mana setiap widget memiliki satu tanggung jawab spesifik, sehingga mengurangi redundansi.

---

