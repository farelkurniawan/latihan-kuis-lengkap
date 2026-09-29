// import 'package:flutter/material.dart';

// class LibraryPage extends StatelessWidget {
//   const LibraryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Library Page')),
//       body: const Center(child: Text('Daftar buku akan muncul di sini')),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/bookModels.dart';
import 'detail_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final book = bookList[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            // InkWell
            child: InkWell(
              onTap: () {
                // Navigasi ke DetailPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(book: book),
                  ),
                );
              },
              child: Row(
                children: [
                  // Menampilkan Cover Buku
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.network(
                      book.imageUrl, 
                      width: 100, 
                      height: 140, 
                      fit: BoxFit.cover,
                      // errorBuilder untuk mengatasi HTTP 404
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 140,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image, 
                            size: 50, 
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  
                  // Menampilkan Informasi Buku
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Judul Buku
                          Text(
                            book.title,
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Nama Penulis
                          Text(
                            book.author,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Tahun Terbit
                          Text(
                            'Tahun: ${book.year}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}