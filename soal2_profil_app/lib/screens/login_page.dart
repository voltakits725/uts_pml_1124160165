
import 'package:flutter/material.dart';
//import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Key untuk mengakses dan menjalankan validasi Form.
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil input pengguna.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Mengatur apakah password terlihat atau disembunyikan.
  bool _passwordVisible = false;

  // Membersihkan controller ketika halaman ditutup.
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Fungsi login.
  void _login() {
    // Jalankan semua validator di dalam Form.
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Jika validasi berhasil, buka halaman profil.
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Ikon aplikasi.
                      Image.asset(
                        'assets/images/logo-login.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 20),

                      // Judul halaman.
                      const Text(
                        'Selamat Datang!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Silakan login untuk melanjutkan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: cs.onSurfaceVariant,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Input email.
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          final email = (value ?? '').trim();

                          if (email.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }

                          final polaEmail =
                              RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

                          if (!polaEmail.hasMatch(email)) {
                            return 'Format email tidak valid';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Input password.
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),

                          // Tombol untuk melihat atau menyembunyikan password.
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        validator: (value) {
                          final password = value ?? '';

                          if (password.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }

                          if (password.length < 8) {
                            return 'Password minimal 8 karakter';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      // Tombol login.
                      FilledButton(
                        onPressed: _login,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}