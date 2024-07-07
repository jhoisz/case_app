import 'package:flutter/material.dart';

import '../../../../core/theme/ca_colors.dart';

class IconCircle extends StatelessWidget {
  const IconCircle({
    super.key,
    required this.pathImage,
  });

  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: CAColors.yellow,
      ),
      child: Center(
        child: Image.asset(
          pathImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
