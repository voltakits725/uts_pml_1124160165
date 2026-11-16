import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final List<Widget> children;
  final Color cardColor;
  final Color dividerColor;
  const InfoCard({
    super.key,
    required this.children,
    required this.cardColor,
    required this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Column(
        children: [
          for(int i = 0; i < children.length; i++) ...[
            children[i],

            if(i != children.length - 1)
              Divider(
                height: 2,
                thickness: 2,
                color: dividerColor,
              )
          ]
        ],
      ),
    );
  }
}