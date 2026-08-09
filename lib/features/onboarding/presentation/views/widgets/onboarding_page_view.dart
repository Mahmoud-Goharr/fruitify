import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/utils/app_images.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        ///onboarding page view item 1
        PageViewItem(
          isVisible: true, // Set visibility based on the current page index
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في ', style: TextStyles.bold23),

              Text(
                'HUB',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          description:
              'اكتشف تجربة تسوق فريدة مع Fruitify. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',

          image: Assets.imagesPageViewItem1Image,
          backgroundimg: Assets.imagesPageViewItem1BackgroundImage,
        ),

        ///onboarding page view item 2
        PageViewItem(
          isVisible: false, // Set visibility based on the current page index
          title: Text('ابحث وتسوق', style: TextStyles.bold23),
          description:
              'اكتشف تجربة تسوق فريدة مع Fruitify. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.imagesPageViewItem2Image,
          backgroundimg: Assets.imagesPageViewItem2BackgroundImage,
        ),
      ],
    );
  }
}
