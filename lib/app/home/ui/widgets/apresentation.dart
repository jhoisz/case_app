import 'package:case_app/app/home/ui/widgets/custom_text_button.dart';

import '../home_page.dart';
import '../../../../core/helpers/custom_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/ca_colors.dart';

class Apresentation extends StatelessWidget {
  const Apresentation({
    super.key,
    required this.onTap,
    required this.pathImage,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  final String buttonText;
  final Function() onTap;
  final String pathImage;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 259,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(pathImage),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        32.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: CAColors.darkGray,
                    ),
                textAlign: TextAlign.center,
              ),
              24.h,
              const Divider(
                color: CAColors.lightGrayVariant,
                thickness: 1,
              ),
              12.h,
              CustomTextButton(
                text: 'vagas em aberto',
                onPressed: onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
