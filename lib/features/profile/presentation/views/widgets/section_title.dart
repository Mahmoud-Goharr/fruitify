import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.grey[300] : null;
    
    return Text(
      title,
      style: TextStyles.semiBold13.copyWith(color: textColor),
    );
  }
}
