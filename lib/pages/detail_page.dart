// import 'package:flutter/material.dart';
// import '../models/bookModels.dart'; // Import modelnya

// class DetailPage extends StatelessWidget {
//   // Menyiapkan variabel penampung data yang dikirim
//   final BookModel book;

//   // Constructor wajib (required) menerima data book[cite: 4]
//   const DetailPage({super.key, required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(book.title), // Menampilkan judul dari data yang dikirim
//       ),
//       body: Center(
//         child: Text('Detail dari buku ${book.title} akan muncul di sini'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class DetailPage extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim dari LibraryPage
  final BookModel book;

  // Constructor wajib (required) menerima data book
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView agar layar bisa di-scroll jika konten melebihi batas layar[cite: 2]
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar Cover (Full Lebar)
            Image.network(
              book.imageUrl,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover, // Memastikan gambar memenuhi area yang disediakan
              // errorBuilder untuk jaga-jaga kalau link gambar detail mati juga
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                );
              },
            ),
            
            // 2. Bagian Konten Teks (dibungkus Padding agar tidak menempel ke tepi layar)[cite: 2]
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Buku
                  Text(
                    book.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  
                  // Penulis
                  Text(
                    'Oleh: ${book.author}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  
                  // Row untuk menampilkan beberapa info berjajar ke samping[cite: 2]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoBox('Tahun', book.year.toString()),
                      _buildInfoBox('Halaman', '${book.pages} Hal'),
                      _buildInfoBox('Rating', '⭐ ${book.rating}'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Genre & Penerbit
                  Text('Genre: ${book.genre}', style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text('Penerbit: ${book.publisher}', style: const TextStyle(fontSize: 14)),
                  
                  // Garis pembatas
                  const Divider(height: 32, thickness: 1),
                  
                  // Sinopsis / Deskripsi
                  const Text(
                    'Sinopsis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.description,
                    style: const TextStyle(fontSize: 14, height: 1.5), // height untuk merenggangkan jarak antar baris teks
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi bantuan (helper function) untuk membuat kotak info (Tahun, Halaman, Rating)
  // Ini dilakukan agar kita tidak perlu menulis ulang kode Column yang sama berkali-kali[cite: 2]
  Widget _buildInfoBox(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}