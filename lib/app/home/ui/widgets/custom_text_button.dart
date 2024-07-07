import 'package:case_app/core/helpers/custom_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/ca_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            8.w,
            const Icon(
              Icons.arrow_forward_ios,
              color: CAColors.blue,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}