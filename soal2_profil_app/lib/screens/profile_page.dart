
import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/profile_content.dart';
import 'about_page.dart';

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
  // Data profil mahasiswa
  Profile profile = Profile.initial;

  // Index halaman yang sedang aktif
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            onPressed: () {
              widget.onThemeChanged(
                isDark ? ThemeMode.light : ThemeMode.dark,
              );
            },
            icon: Icon(
              isDark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),

      // Body
      body: _selectedIndex == 0
          ? ProfileContent(profile: profile)
          : const AboutPage(),

      // Bottom Navigation
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

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Fitur Edit Profil akan segera dibuat',
              ),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
