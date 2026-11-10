import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Rafly Kurniawan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const ProfilPage(), 
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Rafly Kurniawan',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'NIM: 1124160165',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Program Studi: Teknik Informatika',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                
                const KartuKontak(),
                const SizedBox(height: 16),
                
                const KartuKeahlian(),
              ],
            ),
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Terima kasih telah melihat profil saya!"),
            ),
          );
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData ikon; 
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.ikon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(ikon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

class KartuKontak extends StatelessWidget {
  const KartuKontak({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            InfoTile(ikon: Icons.email, label: 'Email', value: 'Rafly@gmail.com'),
            Divider(), 
            InfoTile(ikon: Icons.phone, label: 'Telepon', value: '0798787987787'),
            Divider(),
            InfoTile(ikon: Icons.class_, label: 'Kelas', value: 'TI SE-1 24'), 
            Divider(),
            InfoTile(ikon: Icons.code, label: 'Github', value: 'voltakits725'),
          ],
        ),
      ),
    );
  }
}

class KartuKeahlian extends StatelessWidget {
  const KartuKeahlian({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            InfoTile(ikon: Icons.sports_esports, label: 'Hobi', value: 'Bermain Game COC'),
            Divider(),
            InfoTile(ikon: Icons.computer, label: 'Keahlian', value: 'Flutter Development'),
            Divider(),
            InfoTile(ikon: Icons.camera_alt, label: 'Hobi', value: 'Tidur'),
          ],
        ),
      ),
    );
  }
}