
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final ValueChanged<ThemeMode> onThemeChanged;
  const ProfilePage({
    super.key,
    required this.onThemeChanged,
    });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile.initial;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            onPressed: () {
              final isDark =
                  Theme.of(context).brightness == Brightness.dark;

              widget.onThemeChanged(
                isDark ? ThemeMode.light : ThemeMode.dark,
              );
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),

      body: _selectedIndex == 0
          ? _buildProfile()
          : _buildAbout(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang Saya',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fitur Edit Profil akan segera dibuat'),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildProfile() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Profil
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: const AssetImage(
                      'assets/images/hihu.jpeg',
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    profile.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    profile.nim,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    profile.prodi,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Informasi Akademik
            Text(
              'Informasi Akademik',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            Card(
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.school_outlined,
                    label: 'Konsentrasi',
                    value: profile.konsentrasi,
                  ),
                  InfoTile(
                    icon: Icons.class_outlined,
                    label: 'Kelas',
                    value: profile.kelas,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bio
            Text(
              'Tentang Saya',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(profile.bio),
              ),
            ),

            const SizedBox(height: 20),

            // Informasi Kontak
            Text(
              'Informasi Kontak',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            Card(
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: profile.email,
                  ),
                  InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Nomor HP',
                    value: profile.phone,
                  ),
                  InfoTile(
                    icon: Icons.code,
                    label: 'GitHub',
                    value: profile.github,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbout() {
    return const Center(
      child: Text('Halaman Tentang Saya'),
    );
  }
}
