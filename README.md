# Task 4 - Flutter Fundamental

Implementasi UI katalog produk Flutter dengan gaya clean, modular, dan estetik vintage/wabi-sabi.

## Fitur Utama

- Layout utama menggunakan `Column`, elemen horizontal menggunakan `Row`.
- `ListView` horizontal untuk kategori produk.
- `ListView` vertikal untuk area daftar produk.
- Grid produk dibuat dari data dummy dinamis.
- `ProductCard` dipisah menjadi widget terpisah agar reusable.
- Menggunakan `NetworkImage` untuk gambar placeholder.
- Tanpa `BottomNavigationBar`, judul halaman hanya teks `Products`.

## Struktur Folder

```text
lib/
├── models/
│   └── product_model.dart
├── widgets/
│   ├── category_item.dart
│   └── product_card.dart
├── screens/
│   └── product_catalog_screen.dart
├── main.dart
└── main_single_file.dart
```

## Penjelasan Hierarki Layout

1. `Column` dipakai sebagai struktur vertikal utama: judul, kategori, lalu area produk.
2. Bagian kategori memakai `ListView.builder` horizontal agar item kategori bisa di-scroll ke samping.
3. Bagian produk dibungkus `Expanded` supaya tinggi area list menyesuaikan sisa ruang dan tidak overflow.
4. Di dalam `Expanded`, dipakai `ListView` vertikal sebagai scroll utama.
5. Grid produk (`GridView.builder`) dibuat non-scroll (`NeverScrollableScrollPhysics`) supaya kontrol scroll tetap di parent `ListView`.
6. `Row` dipakai di `ProductCard` untuk susunan rating dan harga.

## Cara Menjalankan (Versi Modular)

```bash
flutter pub get
flutter run
```

`main.dart` sudah mengarah ke versi modular.

## Opsi Single File (Untuk Pengumpulan Cepat)

File `main_single_file.dart` berisi implementasi lengkap dalam satu file.

Jika ingin menjalankan versi ini:
1. Rename `lib/main.dart` menjadi misalnya `lib/main_modular.dart`.
2. Rename `lib/main_single_file.dart` menjadi `lib/main.dart`.
3. Jalankan kembali `flutter run`.

## Catatan Screenshot

Tambahkan screenshot hasil UI di folder `screenshots/` (opsional untuk laporan), lalu sisipkan di README jika dibutuhkan dosen/asisten.
