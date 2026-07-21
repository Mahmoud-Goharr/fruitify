import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundimg,
    required this.isVisible,
  });

  final Widget title;
  final String description;
  final String image;
  final String backgroundimg;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    backgroundimg,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SvgPicture.asset(image),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: GestureDetector(
                    onTap: () {
                      prehs.setbool(kIsOnBoardingViewSeen, true);

                      Navigator.of(
                        context,
                      ).pushReplacementNamed('loginView');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(25.r),
                      child: Text(
                        'تخط',
                        style: TextStyles.regular16.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 64.h),

          title,

          SizedBox(height: 24.h),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 37.w,
            ),
            child: Text(
              description,
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF4E5556),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}