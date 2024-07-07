import 'package:case_app/core/helpers/custom_size.dart';
import 'package:flutter/material.dart';

class MeetOurTeam extends StatelessWidget {
  const MeetOurTeam({
    super.key,
    required this.title,
    required this.imagesPath,
  });

  final String title;
  final List<String> imagesPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          32.h,
          ...imagesPath.map((imagePath) {
            return Container(
              height: 183,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}