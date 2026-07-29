# Aplikasi Pembuat Modul Ajar Kurikulum Merdeka

Aplikasi berbasis Flutter untuk mempermudah guru dan tenaga pendidik dalam menyusun Modul Ajar sesuai dengan standar Kurikulum Merdeka. Aplikasi ini menyediakan antarmuka *wizard* (langkah demi langkah) yang mencakup Informasi Umum, Komponen Inti, dan Lampiran, serta pratinjau modul yang rapi.

## Fitur Utama
- **Daftar Modul Ajar**: Melihat daftar semua modul ajar yang telah dibuat.
- **Wizard Form Berbasis Langkah**: Pengisian data yang terstruktur melalui langkah:
  1. Informasi Umum (Identitas modul, mata pelajaran, fase/kelas)
  2. Komponen Inti (Tujuan, kegiatan, asesmen)
  3. Lampiran (Bahan bacaan, dsb)
- **Pratinjau Modul**: Tampilan yang rapi untuk membaca keseluruhan isi modul ajar yang disusun.

## Teknologi
- Flutter
- Dart
- Material Design 3

## Cara Menjalankan
1. Pastikan Flutter telah terpasang.
2. Clone repository ini.
3. Jalankan `flutter pub get` untuk mengunduh dependensi (termasuk paket `uuid`).
4. Pastikan paket `uuid` sudah ada di `pubspec.yaml` (misalnya `uuid: ^4.3.3`).
5. Jalankan `flutter run` di terminal.

---

## Tentang CouldAI

Aplikasi ini dihasilkan dengan [CouldAI](https://could.ai), sebuah pembangun aplikasi berbasis AI untuk aplikasi lintas platform. CouldAI mengubah *prompt* teks menjadi aplikasi *native* iOS, Android, Web, dan Desktop melalui agen AI otonom yang dapat merancang struktur aplikasi, membangun fitur, menguji, melakukan deployment, dan menyempurnakan kode siap produksi secara berkelanjutan.
