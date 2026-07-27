import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/assets.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/features/auth/doamin/repos/auth_rebo.dart';
import 'package:fruitify/features/auth/presentation/views/login_view.dart';
import 'package:fruitify/features/home/presentation/views/main_view.dart';
import 'package:fruitify/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:get_it/get_it.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.assetsImagesPlant)],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo, fit: BoxFit.none),
        SvgPicture.asset(Assets.assetsImagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNaviagtion() {
    Future.delayed(const Duration(seconds: 3), () {
      final isOnBoardingViewSeen = prehs.getbool(kIsOnBoardingViewSeen);

      if (!isOnBoardingViewSeen) {
        Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName);
        return;
      }

      final authRepo = GetIt.I<AuthRepo>();

      if (authRepo.isLoggedIn()) {
        Navigator.of(context).pushReplacementNamed(MainView.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
      }
    });
  }
}
