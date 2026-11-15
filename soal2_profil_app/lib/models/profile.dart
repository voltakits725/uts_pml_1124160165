
class Profile {
  final String name;
  final String nim;
  final String prodi;
  final String konsentrasi;
  final String kelas;
  final String bio;
  final String email;
  final String phone;
  final String github;

  const Profile({
    required this.name,
    required this.nim,
    required this.prodi,
    required this.konsentrasi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.phone,
    required this.github,
  });

  // Data awal profil
  static const initial = Profile(
    name: 'Nama Mahasiswa',
    nim: 'NIM lu',
    prodi: 'Teknik Informatika',
    konsentrasi: 'Software Engineering',
    kelas: 'Kelas lu',
    bio: 'Mahasiswa yang tertarik dengan Backend Development.',
    email: 'email@gmail.com',
    phone: '081234567890',
    github: 'github.com/username',
  );

  // Membuat salinan dengan data yang diperbarui
  Profile copyWith({
    String? name,
    String? nim,
    String? prodi,
    String? konsentrasi,
    String? kelas,
    String? bio,
    String? email,
    String? phone,
    String? github,
  }) {
    return Profile(
      name: name ?? this.name,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      konsentrasi: konsentrasi ?? this.konsentrasi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      github: github ?? this.github,
    );
  }
}
