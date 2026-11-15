class ProfileData{
  const ProfileData({
    required this.nama,
    required this.nim,
    required this.program_studi,
    required this.konsentrasi,
    required this.kelas,
    required this.bio,
    required this.location,
    required this.email,
    required this.nomor_hp,
    required this.account_github,
    required this.skills,
    required this.joined,
   
  });

  final String nama;
  final String nim;
  final String program_studi;
  final String konsentrasi;
  final String kelas;
  final String bio;
  final String location;
  final String email;
  final String nomor_hp;
  final String account_github;
  final List<String> skills;
  final String joined;

  static const ProfileData contoh = ProfileData(
    nama: 'Rafly Kurniawan',
    nim: '1124160165',
    program_studi: 'Teknik Informatika',
    konsentrasi: 'Software Engineering',
    kelas: 'TI 24 SE 1',
    bio: 'HIIIHHUUUUU',
    location: 'Tangerang, Indonesia',
    email: 'rafly.kurniawan@cihuy.com',
    nomor_hp: '0978787877987897',
    account_github: 'voltakits725',
    skills: ['Python', 'Flutter', 'Dart', 'Figma', 'UI/UX', 'Express.js', 'Java'],
    joined: 'November 2026',

  );

  String get initials => initialsOf(nama);
  //Getter ini digunakan untuk mendapatkan inisial dari nama pengguna.

  static String initialsOf(String value) {
    final parts = value
        .trim() 
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty) 
        .toList();

    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    
    return '${parts[0].substring(0, 1)}${parts[1].substring(0, 1)}'
        .toUpperCase();
  }

  ProfileData copyWith({
    String? nama,
    String? nim,
    String? kelas,
    String? program_studi,
    String? konsentrasi,
    String? bio,
    String? location,
    String? email,
  }){
    return ProfileData(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      kelas: kelas ?? this.kelas,
      program_studi: program_studi ?? this.program_studi,
      konsentrasi: konsentrasi ?? this.konsentrasi,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      email: email ?? this.email,
      nomor_hp: nomor_hp,
      account_github: account_github,
      skills: skills,
      joined: joined,
    );
  }
}