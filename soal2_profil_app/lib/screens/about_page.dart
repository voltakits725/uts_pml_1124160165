import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(Icons.person_outline, size: 45, color: Theme.of(context).colorScheme.primary,),
              )
            ],
          ),
        )
      ],
    );
  }
}