import 'package:flutter/material.dart';
import 'package:soal2_profil_app/models/profile_data.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profile,
    required this.onEdit,
    required this.onShare,
    });

    final ProfileData profile;
    final VoidCallback onEdit;
    final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}