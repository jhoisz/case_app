import 'package:case_app/app/home/ui/widgets/custom_text_button.dart';
import 'package:case_app/app/home/ui/widgets/icon_circle.dart';
import 'package:case_app/core/theme/ca_colors.dart';
import 'package:case_app/core/helpers/custom_size.dart';
import 'package:flutter/material.dart';

class CompanyCulture extends StatelessWidget {
  const CompanyCulture({
    super.key,
    required this.pathImage,
    required this.title,
    required this.description,
    this.buttonText,
    this.onPressed,
  });

  final String pathImage;
  final String title;
  final String description;
  final String? buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconCircle(
          pathImage: pathImage,
        ),
        24.h,
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: CAColors.darkGray,
              ),
          textAlign: TextAlign.center,
        ),
        24.h,
        Text(
          description,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: CAColors.gray,
              ),
          textAlign: TextAlign.center,
        ),
        12.h,
        if (buttonText != null && onPressed != null)
          CustomTextButton(
            text: buttonText!,
            onPressed: onPressed!,
          ),
        40.h,
      ],
    );
  }
}