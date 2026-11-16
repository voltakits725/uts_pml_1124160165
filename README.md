# Ujian Tengah Semester (UTS) – Aplikasi Mobile

**Aplikasi Profil Mahasiswa – Flutter**

Institut Teknologi & Bisnis Bina Sarana Global  
Semester 5 (Ganjil) 2026/2027

---

## 👤 Identitas Mahasiswa

| Data | Keterangan |
|---|---|
| Nama | Rafly Kurniawan |
| NIM | 1124160165 |
| Program Studi | Teknik Informatika |
| Konsentrasi | Software Engineering |
| Mata Kuliah | Pemrograman Mobile Lanjutan |
| Repository | [uts_pml_1124160165](https://github.com/voltakits725/uts_pml_1124160165) |

---

## 🎬 Video Presentasi YouTube

Video presentasi berisi demonstrasi aplikasi, penjelasan kode program, serta proses pengembangan aplikasi.

🔗 **Link Video:** [Masukkan Link YouTube]

---

## 📦 Unduhan APK Release

Aplikasi Android telah dibuat menggunakan perintah `flutter build apk --release`.

📥 **Download APK:** [Download Aplikasi v1.0.0](https://github.com/voltakits725/uts_pml_1124160165/releases/tag/v1.0.0)

---

## 📱 Daftar Fitur Aplikasi (Soal 2)

### 1. Halaman Login (`login_page.dart`)

- Menggunakan `StatefulWidget` untuk mengelola perubahan state.
- Validasi email menggunakan format email yang benar.
- Validasi password minimal 8 karakter.
- Fitur tampil dan sembunyikan password.
- Simulasi proses login menggunakan `Future.delayed`.
- Navigasi menuju halaman profil menggunakan `Navigator.pushReplacement`.

### 2. Halaman Profil (`profile_page.dart`)

- Menampilkan foto profil menggunakan `CircleAvatar`.
- Menampilkan informasi identitas mahasiswa.
- Menampilkan informasi akademik dan kontak.
- Menggunakan komponen widget terpisah agar kode lebih terstruktur.
- Memiliki tombol untuk mengedit informasi profil.

### 3. Halaman Edit Profil (`edit_profile_page.dart`)

- Form otomatis terisi dengan data profil sebelumnya.
- Menggunakan `TextEditingController`.
- Validasi nama wajib diisi.
- Validasi NIM harus terdiri dari 10 digit angka.
- Validasi email menggunakan Regular Expression.
- Validasi nomor HP hanya menerima 10–13 digit angka.
- Mengirimkan data profil terbaru menggunakan `Navigator.pop`.
- Memperbarui tampilan profil menggunakan `setState`.

### 4. Halaman Tentang Saya (`about_page.dart`)

- Menampilkan informasi keahlian dan hobi.
- Menampilkan riwayat pendidikan.
- Menggunakan `StatelessWidget` dan `ListView`.
- Memanfaatkan widget reusable untuk menampilkan informasi.

### 5. Widget Pendukung

Beberapa komponen tampilan dipisahkan ke dalam file tersendiri, antara lain:

- `profile_content.dart` – Mengatur tampilan konten informasi profil.
- `info_tile.dart` – Menampilkan informasi menggunakan ikon, judul, dan keterangan.
- `info_card.dart` – Membungkus beberapa komponen informasi dalam Card.

### 6. Tema Terang dan Gelap (Light & Dark Mode)

- Menggunakan konfigurasi `ThemeData`.
- Mendukung Light Mode dan Dark Mode.
- Pergantian tema dilakukan secara langsung melalui aplikasi.
- Menggunakan Material Design 3.
- Konfigurasi tema dipisahkan ke dalam `app_theme.dart`.

### 7. Navigasi dan Komponen Scaffold

- Menggunakan AppBar sebagai bagian navigasi aplikasi.
- Menggunakan komponen navigasi antarhalaman.
- Memisahkan tampilan halaman dan widget agar kode lebih mudah dikelola.

---

## 📸 Screenshot Aplikasi

Dokumentasi tampilan aplikasi:

| Halaman Login | Halaman Profil |
|---|---|
| ![Login](docs/screenshots/login.png) | ![Profil](docs/screenshots/profile.png) |

| Halaman Edit Profil | Halaman Tentang Saya |
|---|---|
| ![Edit Profil](docs/screenshots/edit-profile.png) | ![About](docs/screenshots/about.png) |



---

## 📂 Struktur Repository

```text
uts_pml_1124160165/
│
├── soal1-live-coding/
│   └── ...
│
├── soal2_profil_app/
│   ├── android/
│   ├── assets/
│   │   └── images/
│   │
│   ├── lib/
│   │   ├── main.dart
│   │   ├── app_theme.dart
│   │   ├── models/
│   │   │   └── profile.dart
│   │   │
│   │   ├── pages/
│   │   │   ├── login_page.dart
│   │   │   ├── profile_page.dart
│   │   │   ├── edit_profile_page.dart
│   │   │   └── about_page.dart
│   │   │
│   │   └── widgets/
│   │       ├── profile_content.dart
│   │       ├── info_tile.dart
│   │       └── info_card.dart
│   │
│   ├── pubspec.yaml
│   └── README.md
│
└── README.md
```

---

## 🚀 Cara Menjalankan Aplikasi

### 1. Prasyarat

- Flutter SDK.
- Dart SDK.
- Android Studio atau Visual Studio Code.
- Android Emulator atau perangkat Android.
- Ekstensi Flutter dan Dart.

### 2. Clone Repository

```bash
git clone https://github.com/voltakits725/uts_pml_1124160165.git
```

Masuk ke folder aplikasi:

```bash
cd uts_pml_1124160165/soal2_profil_app
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Jalankan Aplikasi

Pastikan perangkat Android atau emulator sudah terhubung.

```bash
flutter devices
```

Kemudian jalankan:

```bash
flutter run
```

---

## 🛠️ Build APK Release

Untuk menghasilkan aplikasi Android dalam format APK, jalankan perintah:

```bash
flutter build apk --release
```

File APK akan tersimpan pada direktori:

```text
build/app/outputs/flutter-apk/app-release.apk
```

APK dapat diunggah melalui GitHub Releases dengan tag `v1.0.0`.

---

## 📚 Teknologi yang Digunakan

- **Flutter** – Framework pengembangan aplikasi mobile.
- **Dart** – Bahasa pemrograman.
- **Material Design 3** – Sistem desain antarmuka aplikasi.
- **Android Studio** – Lingkungan pengembangan dan emulator.
- **Git & GitHub** – Version control dan penyimpanan repository.

---

## 📝 Kesimpulan

Melalui proyek Ujian Tengah Semester ini, saya mempelajari proses pengembangan aplikasi mobile menggunakan Flutter, mulai dari pembuatan antarmuka, pengelolaan state, validasi form, navigasi antarhalaman, hingga penerapan tema terang dan gelap.

Proyek ini juga memberikan pengalaman dalam menerapkan konsep pemrograman berorientasi objek, penggunaan widget reusable, serta pengelolaan source code menggunakan Git dan GitHub.

---

**Dibuat oleh Rafly Kurniawan – Teknik Informatika**

**Institut Teknologi & Bisnis Bina Sarana Global | 2026**
