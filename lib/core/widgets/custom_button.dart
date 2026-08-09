import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.primaryColor),
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          backgroundColor: color ?? AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold16.copyWith(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
