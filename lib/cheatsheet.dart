import 'package:flutter/material.dart';

// ============================================================================
// 1. DASAR BAHASA DART (Variabel, Tipe Data, & Koleksi)
// ============================================================================
void jalankanDasarDart() {
  // Variabel & Tipe Data
  int umur = 22;
  double berat = 65.5;
  String nama = "Bambang";
  bool isMahasiswa = true;

  // const vs final
  // const: nilainya harus sudah diketahui saat kode ditulis (compile-time).
  const double pi = 3.14; 
  // final: nilainya bisa didapatkan saat kode dijalankan (run-time), tapi setelah itu tidak bisa diubah.
  final waktuSekarang = DateTime.now(); 

  // List (Array) -> Kumpulan data yang memiliki urutan (index).
  List<String> hobi = ["Gaming", "Coding", "Membaca"];
  hobi.add("Futsal"); // Menambah data

  // Set -> Kumpulan data unik (tidak boleh ada yang kembar).
  Set<int> nomorUnik = {1, 2, 3, 3, 4}; // Angka 3 hanya akan disimpan satu kali.

  // Map -> Kumpulan data berbasis Key-Value (seperti JSON/Dictionary).
  Map<String, dynamic> userMap = {
    "username": "bambang123",
    "password": "passwordKuat",
    "age": umur,
  };

  // Control Flow (Logika If-Else & Looping)
  if (umur >= 18 && isMahasiswa) {
    print("$nama adalah mahasiswa dewasa.");
  } else {
    print("Kondisi tidak terpenuhi.");
  }

  // Looping melalui List
  for (String h in hobi) {
    print("Hobi: $h");
  }
}


// ============================================================================
// 2. OBJECT-ORIENTED PROGRAMMING (OOP) DI DART
// OOP berguna untuk membuat struktur data (Model) yang rapi dan terpusat[cite: 3].
// ============================================================================

// A. Class & Encapsulation
// Class adalah 'cetak biru' (blueprint) untuk membuat objek[cite: 3].
class Pengguna {
  // Atribut publik
  String nama;
  String email;
  
  // Atribut privat (diawali dengan underscore '_') hanya bisa diakses di dalam file ini.
  String _password; 

  // Constructor: Fungsi yang pertama kali dipanggil saat objek dibuat[cite: 3].
  Pengguna({required this.nama, required this.email, required String password}) 
      : _password = password;

  // Method (Fungsi di dalam class)
  void sapa() {
    print("Halo, nama saya $nama!");
  }

  // Getter untuk mengambil data privat secara aman
  String get getPassword => _password;
}

// B. Inheritance (Pewarisan)
// Class Mahasiswa 'mewarisi' semua sifat dari class Pengguna.
class Mahasiswa extends Pengguna {
  String nim;

  Mahasiswa({
    required String nama,
    required String email,
    required String password,
    required this.nim,
  }) : super(nama: nama, email: email, password: password); // super() memanggil constructor induk.

  @override
  void sapa() {
    print("Halo, saya mahasiswa bernama $nama dengan NIM $nim.");
  }
}

void jalankanOOP() {
  // Membuat Objek (Instansiasi) dari model yang sudah dibuat[cite: 3].
  Mahasiswa mhs1 = Mahasiswa(
    nama: "Bambang",
    email: "bambang@test.com",
    password: "rahasia123",
    nim: "123456789",
  );
  
  mhs1.sapa(); // Output: Halo, saya mahasiswa bernama Bambang...
}


// ============================================================================
// 3. FRAMEWORK FLUTTER (UI, Widget, & State)
// Di Flutter, segala sesuatu yang tampil di layar adalah Widget (Everything is Widget)[cite: 2].
// ============================================================================

void main() {
  // Kamu bisa memanggil fungsi Dart/OOP di sini untuk di-print ke terminal debug
  jalankanDasarDart();
  jalankanOOP();

  // Memulai aplikasi Flutter
  runApp(const MyApp());
}

// A. STATETLESS WIDGET
// Widget yang tampilannya statis dan tidak bisa berubah setelah dijalankan[cite: 3].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheatsheet Flutter',
      home: const ContohHalamanUtama(), // MaterialApp mengatur rute dan tema dasar[cite: 2].
    );
  }
}

// B. STATEFUL WIDGET
// Widget yang dinamis, bisa merespons interaksi user, dan mengubah tampilannya[cite: 3].
class ContohHalamanUtama extends StatefulWidget {
  const ContohHalamanUtama({super.key});

  @override
  State<ContohHalamanUtama> createState() => _ContohHalamanUtamaState();
}

class _ContohHalamanUtamaState extends State<ContohHalamanUtama> {
  // 1. STATE (Data yang bisa berubah)
  int _counter = 0;
  String _teksStatus = "Belum ditekan";

  // 2. FUNGSI LOGIKA (Mengubah state)
  void _tambahAngka() {
    // setState() memberitahu Flutter bahwa ada data yang berubah, 
    // sehingga fungsi build() harus dijalankan ulang untuk memperbarui UI[cite: 3].
    setState(() {
      _counter++;
      _teksStatus = "Ditekan sebanyak $_counter kali";
    });
  }

  // 3. BUILD UI (Menyusun layout)
  @override
  Widget build(BuildContext context) {
    // Scaffold adalah kerangka dasar layar (menyediakan AppBar, Body, FAB)[cite: 2].
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh OOP & Flutter"),
      ),
      // Center & Column adalah Layout Widget untuk mengatur tata letak[cite: 2].
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Posisi elemen di tengah vertikal[cite: 2].
          children: [
            Text(
              _teksStatus,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Memberi jarak kosong (Spacer)[cite: 2].
            
            // Tombol untuk memicu perubahan State
            ElevatedButton(
              onPressed: _tambahAngka,
              child: const Text("Tambah Angka"),
            ),
          ],
        ),
      ),
    );
  }
}