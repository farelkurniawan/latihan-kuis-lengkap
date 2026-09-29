// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//       ),
//       body: const Center(
//         child: Text('Ini akan jadi form login'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'library_page.dart'; // Import halaman tujuan

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Siapkan controller untuk form[cite: 3]
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // 2. Siapkan variabel state untuk error handling[cite: 3]
  bool _isLoginFailed = false; 

  // 3. Fungsi logika saat tombol ditekan
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Pengecekan data dummy
    if (email == "farel" && password == "163") {
      setState(() {
        _isLoginFailed = false;
      });
      // Pindah halaman tanpa bisa di-back[cite: 4]
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LibraryPage()),
      );
    } else {
      setState(() {
        _isLoginFailed = true; // State berubah[cite: 3]
      });
      // Tampilkan notifikasi error di bawah layar[cite: 3]
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal: Email atau Password salah'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Aplikasi Perpustakaan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30), // Widget untuk memberi jarak[cite: 2]
              
              // TextField Email[cite: 3]
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email (isi: farel)',
                  border: const OutlineInputBorder(),
                  // Ubah warna merah jika isLoginFailed true[cite: 3]
                  errorText: _isLoginFailed ? 'Email/Password salah' : null, 
                ),
              ),
              const SizedBox(height: 16),
              
              // TextField Password[cite: 3]
              TextField(
                controller: _passwordController,
                obscureText: true, // Amankan inputan password (jadi titik-titik)[cite: 3]
                decoration: InputDecoration(
                  hintText: 'Password (isi: 163)',
                  border: const OutlineInputBorder(),
                  errorText: _isLoginFailed ? 'Email/Password salah' : null,
                ),
              ),
              const SizedBox(height: 24),
              
              // ElevatedButton (Tombol Material Design)[cite: 2]
              ElevatedButton(
                onPressed: _login, // Panggil function saat diklik[cite: 3]
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}