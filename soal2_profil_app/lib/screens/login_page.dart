
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          // Background kampus
          Positioned.fill(
            child: Image.asset(
              'assets/images/campus_static.gif',
              fit: BoxFit.cover,
            ),
          ),

          // Overlay background
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.20),
            ),
          ),

          // Login content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 420,
                  ),
                  child: Card(
                    elevation: 8,
                    color: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            // Logo aplikasi
                            Image.asset(
                              'assets/images/logo-login.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),

                            const SizedBox(height: 20),

                            // Judul
                            Text(
                              'Selamat Datang!',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Silakan login untuk melanjutkan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Input email
                            TextFormField(
                              controller: _emailController,
                              keyboardType:
                                  TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                              validator: (value) {
                                final email = (value ?? '').trim();

                                if (email.isEmpty) {
                                  return 'Email tidak boleh kosong';
                                }

                                final emailPattern = RegExp(
                                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                );

                                if (!emailPattern.hasMatch(email)) {
                                  return 'Format email tidak valid';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // Input password
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible =
                                          !_passwordVisible;
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

                            // Tombol login
                            FilledButton(
                              onPressed:
                                  _isLoading ? null : _login,
                              style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(
                                  vertical: 16,
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
                  ),
                ),
              ),
            ),
          ),
        ],
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
