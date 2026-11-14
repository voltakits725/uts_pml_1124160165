import 'package:flutter/material.dart';

// import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool _isLoading = false;

  // Proses login
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulasi proses login
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    // Navigasi ke halaman profil
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  // Ilustrasi kampus di atas
                  Image.asset(
                    'assets/images/login-ilustrasi.png',
                    height: screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 16),

                  // Card form login
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(0.12),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Judul
                          Text(
                            'Selamat Datang!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.indigo.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Silakan login untuk melanjutkan',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),

                          const SizedBox(height: 28),

                          // Email
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email_outlined),
                              filled: true,
                              fillColor: const Color(0xFFF5F3FF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              final email = (value ?? '').trim();

                              if (email.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }

                              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                  .hasMatch(email)) {
                                return 'Format email tidak valid';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 18),

                          // Password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock_outline),
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
                              filled: true,
                              fillColor: const Color(0xFFF5F3FF),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
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

                          const SizedBox(height: 28),

                          // Tombol Login
                          FilledButton(
                            onPressed: _isLoading ? null : _login,
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.indigo.shade700,
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman sementara
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Berhasil Login!'),
      ),
    );
  }
}