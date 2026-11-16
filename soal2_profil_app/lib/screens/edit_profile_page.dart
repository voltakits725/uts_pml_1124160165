
import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'package:flutter/services.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _nimController;
  late final TextEditingController _prodiController;
  late final TextEditingController _konsentrasiController;
  late final TextEditingController _kelasController;
  late final TextEditingController _bioController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _githubController;

  @override
  void initState() {
    super.initState();

    final profile = widget.profile;

    _nameController = TextEditingController(text: profile.name);
    _nimController = TextEditingController(text: profile.nim);
    _prodiController = TextEditingController(text: profile.prodi);
    _konsentrasiController =
        TextEditingController(text: profile.konsentrasi);
    _kelasController = TextEditingController(text: profile.kelas);
    _bioController = TextEditingController(text: profile.bio);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _githubController = TextEditingController(text: profile.github);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _konsentrasiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _githubController.dispose();

    super.dispose();
  }

  // Menyimpan perubahan profil
  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final updatedProfile = widget.profile.copyWith(
      name: _nameController.text.trim(),
      nim: _nimController.text.trim(),
      prodi: _prodiController.text.trim(),
      konsentrasi: _konsentrasiController.text.trim(),
      kelas: _kelasController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      github: _githubController.text.trim(),
    );

    Navigator.pop(context, updatedProfile);
  }

  // Widget input form
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters, // Tambahkan ini
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters, // Tambahkan ini

      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),

      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return '$label tidak boleh kosong';
            }
            return null;
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),

      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Data Pribadi
            Text(
              'Data Pribadi',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Nama Lengkap',
              controller: _nameController,
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'NIM',
              controller: _nimController,
              icon: Icons.badge_outlined,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: TextInputType.number,
              validator: (value) {
                final nim = value?.trim() ?? '';

                if (nim.isEmpty) {
                  return 'NIM tidak boleh kosong';
                }

                if (!RegExp(r'^[0-9]{10}$').hasMatch(nim)) {
                  return 'NIM harus 10 digit, tidak boleh lebih';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Program Studi',
              controller: _prodiController,
              icon: Icons.school_outlined,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Konsentrasi',
              controller: _konsentrasiController,
              icon: Icons.computer_outlined,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Kelas',
              controller: _kelasController,
              icon: Icons.class_outlined,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Bio',
              controller: _bioController,
              icon: Icons.description_outlined,
              maxLines: 3,
            ),

            const SizedBox(height: 24),

            // Informasi Kontak
            Text(
              'Informasi Kontak',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Email',
              controller: _emailController,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email tidak boleh kosong';
                }

                if (!RegExp(
                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                ).hasMatch(value.trim())) {
                  return 'Format email tidak valid';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'Nomor HP',
              controller: _phoneController,
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (value) {
                final phone = value?.trim() ?? '';

                if (phone.isEmpty) {
                  return 'Nomor HP tidak boleh kosong';
                }

                if (!RegExp(r'^[0-9]{10,13}$').hasMatch(phone)) {
                  return 'Nomor HP harus 10-13 digit';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            _buildTextField(
              label: 'GitHub',
              controller: _githubController,
              icon: Icons.code,
            ),

            const SizedBox(height: 28),

            // Tombol Simpan
            FilledButton.icon(
              onPressed: _saveProfile,
              icon: const Icon(Icons.save_outlined),
              label: const Text('Simpan Perubahan'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
