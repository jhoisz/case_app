import 'package:flutter/material.dart';

import '../../../../core/theme/ca_colors.dart';
import '../../../../core/helpers/custom_size.dart';

class SalesWoman extends StatelessWidget {
  const SalesWoman({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.pathImage,
  });

  final String title;
  final String subtitle;
  final String description;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: CAColors.lightGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 259,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(pathImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          4.h,
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          24.h,
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          40.h,
        ],
      ),
    );
  }
}
