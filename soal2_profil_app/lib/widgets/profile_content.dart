
import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'info_tile.dart';

class ProfileContent extends StatelessWidget {
  final Profile profile;

  const ProfileContent({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final cardColor = isDark
        ? const Color(0xFF25283A)
        : const Color(0xFFEEF0FF);

    final dividerColor = isDark
        ? const Color(0xFF414968)
        : const Color(0xFFC7CCF5);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header profil
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/images/hihu.jpeg',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile.name,
                    style: Theme.of(context)
                        .textTheme.headlineSmall
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(profile.nim),
                  const SizedBox(height: 4),
                  Text(profile.prodi),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Informasi akademik
            Text(
              'Informasi Akademik',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),

            Card(
              color: cardColor,
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.school_outlined,
                    label: 'Konsentrasi',
                    value: profile.konsentrasi,
                  ),
                  Divider(
                    height: 1,
                    color: dividerColor,
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
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(profile.bio),
              ),
            ),

            const SizedBox(height: 20),

            // Kontak
            Text(
              'Informasi Kontak',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),

            Card(
              color: cardColor,
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: profile.email,
                  ),
                  Divider(
                    height: 1,
                    color: dividerColor,
                  ),
                  InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Nomor HP',
                    value: profile.phone,
                  ),
                  Divider(
                    height: 1,
                    color: dividerColor,
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
}
