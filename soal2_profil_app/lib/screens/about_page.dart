
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
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.code),
                title: Text('Backend Development'),
                subtitle: Text('Node.js, Laravel, dan Express.js'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('Mobile Development'),
                subtitle: Text('Flutter dan Dart'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.storage),
                title: Text('Database Management'),
                subtitle: Text('MySQL, PostgreSQL, dan MongoDB'),
              ),
              Divider(height: 1,),
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

            ],
          ),
        )
      ],
    );
  }
}
