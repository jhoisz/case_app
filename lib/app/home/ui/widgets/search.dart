import 'package:flutter/material.dart';

import '../../../../core/theme/ca_colors.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.hintText,
    required this.searchController,
    required this.onSearch,
  });

  final String hintText;
  final TextEditingController searchController;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onChanged: onSearch,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: CAColors.darkGray,
          ),
      cursorColor: CAColors.blue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall,
        suffixIcon: const Icon(
          Icons.search,
          color: CAColors.darkGray,
          size: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: CAColors.lightGrayVariant,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: CAColors.lightGrayVariant,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: CAColors.blue,
          ),
        ),
      ),
    );
  }
}
