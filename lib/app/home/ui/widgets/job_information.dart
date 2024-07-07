import 'package:case_app/core/helpers/custom_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/ca_colors.dart';

class JobInformation extends StatelessWidget {
  const JobInformation({
    super.key,
    required this.title,
    required this.location,
    this.onTap,
  });

  final String title;
  final String location;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          12.h,
          Text(
            location,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: CAColors.darkGray,
                ),
          ),
          24.h,
          const Divider(
            color: CAColors.grayVariant,
            thickness: 1,
          ),
          24.h,
        ],
      ),
    );
  }
}