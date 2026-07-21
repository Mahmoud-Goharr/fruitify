import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/widgets/custom_bottom.dart';
import 'package:fruitify/features/auth/presentation/views/login_view.dart';
import 'package:fruitify/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

/// pagecontroller is used to control the pageview and to get the current page index.
class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnboardingPageView(
            pageController: pageController,
          ),
        ),

        DotsIndicator(
          dotsCount: 2,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withValues(alpha: 0.5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),

        SizedBox(height: 29.h),

        Visibility(
          visible: currentPage == 1,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kHorizintalPadding.w,
            ),
            child: CustomBottom(
              onPressed: () {
                prehs.setbool(kIsOnBoardingViewSeen, true);

                Navigator.of(
                  context,
                ).pushReplacementNamed(LoginView.routeName);
              },
              text: 'ابدا الان',
            ),
          ),
        ),

        SizedBox(height: 43.h),
      ],
    );
  }
}