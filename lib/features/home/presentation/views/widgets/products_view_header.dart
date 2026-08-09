import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitify/core/utils/app_images.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});

  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productsLength نتائج',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ],
    );
  }
}
