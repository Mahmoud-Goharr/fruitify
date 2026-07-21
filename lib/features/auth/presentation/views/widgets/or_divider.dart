import 'package:flutter/material.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFFDCDEDE),
          ),
        ),
        SizedBox(
          width: 18.w,
        ),
        const Text(
          'أو',
          textAlign: TextAlign.center,
          style: TextStyles.semiBold16,
        ),
        SizedBox(
          width: 18.w,
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}