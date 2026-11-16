
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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

        Text(
          'Keahlian & Hobi',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Card(
          elevation: 8,
          color: const Color(0xFFEEF0FF),
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.code),
                title: Text('Backend Development'),
                subtitle: Text('Node.js, Laravel, dan Express.js'),
              ),
              Divider(height: 2, thickness: 4, color: Color(0xFFC7CCF5),),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('Mobile Development'),
                subtitle: Text('Flutter dan Dart'),
              ),
              
              Divider(height: 2, thickness: 4, color: Color(0xFFC7CCF5),),
              ListTile(
                leading: Icon(Icons.storage),
                title: Text('Database Management'),
                subtitle: Text('MySQL, PostgreSQL, dan MongoDB'),
              ),
              Divider(height: 2, thickness: 4, color: Color(0xFFC7CCF5),),
              ListTile(
                leading: const Row(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 8,),
                    Icon(Icons.sports_esports),
                  ],
                ),
                title: const Text('Hobi'),
                subtitle: const Text('Belajar coding dan Bermain Games'),
              ),
              Divider(height: 2, thickness: 4, color: Color(0xFFC7CCF5),),

            ],
          ),
        ),

        const SizedBox(height: 24),
        Text(
          'Riwayat Pendidikan',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12,),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.school_outlined),
                title: Text('Sekolah Menengah Atas'),
                subtitle: Text('SMA, Adalah Pokoknya'),
              ),
              Divider(height: 2, thickness: 4, color: Colors.teal[400],),
              ListTile(
                leading: Icon(Icons.account_balance_outlined),
                title: Text('Global Institute'),
                subtitle: Text('Teknik Informatika - Software Engineering'),
              )
            ],
          ),
        ),
         const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text( 'Saya terus berusaha mengembangkan kemampuan '
              'di bidang teknologi, khususnya pengembangan '
              'perangkat lunak dan aplikasi.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
              
              ),
        
          ),
        )
      ],
    );
  }
}
