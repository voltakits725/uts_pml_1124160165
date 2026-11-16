
import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';
import '../widgets/info_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Header
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.person_outline,
                  size: 45,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Tentang Saya',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 6),

              Text(
                'Mengenal lebih jauh tentang diri saya',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Keahlian dan Hobi
        Text(
          'Keahlian & Hobi',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        const SizedBox(height: 12),

        InfoCard(
          cardColor: cardColor,
          dividerColor: dividerColor,
          children: [
            const InfoTile(
              icon: Icons.code,
              label: 'Backend Development',
              value: 'Node.js, Laravel, dan Express.js',
            ),

            const InfoTile(
              icon: Icons.phone_android,
              label: 'Mobile Development',
              value: 'Flutter dan Dart',
            ),

            const InfoTile(
              icon: Icons.storage,
              label: 'Database Management',
              value: 'MySQL, PostgreSQL, dan MongoDB',
            ),

            const ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.code),
                  SizedBox(width: 8),
                  Icon(Icons.sports_esports),
                ],
              ),
              title: Text('Hobi'),
              subtitle: Text(
                'Belajar Coding dan Bermain Games',
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Riwayat Pendidikan
        Text(
          'Riwayat Pendidikan',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        const SizedBox(height: 12),

        InfoCard(
          cardColor: cardColor,
          dividerColor: dividerColor,
          children: const [
            InfoTile(
              icon: Icons.school_outlined,
              label: 'Sekolah Menengah Atas',
              value: 'SMA, Adalah Pokoknya',
            ),

            InfoTile(
              icon: Icons.account_balance_outlined,
              label: 'Global Institute',
              value: 'Teknik Informatika - Software Engineering',
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Card Penutup
        Card(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(
                  Icons.rocket_launch_outlined,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  'Terus Berkembang',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 8),
                Text(
                  'Saya adalah mahasiswa Teknik Informatika '
                  'dengan konsentrasi Software Engineering. '
                  'Saya memiliki ketertarikan dalam bidang '
                  'pengembangan perangkat lunak, khususnya '
                  'Backend Development dan Mobile Development. '
                  'Saya terus belajar dan mengembangkan '
                  'kemampuan untuk menjadi developer yang lebih baik.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
