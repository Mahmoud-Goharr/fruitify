import 'package:flutter/material.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
    required this.text1,
    required this.text2,
    required this.ontap,
  });

  final String text1;
  final String text2;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyles.semiBold16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        SizedBox(width: 4.w),
        GestureDetector(
          onTap: ontap,
          child: Text(
            text2,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}