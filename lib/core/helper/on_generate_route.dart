import 'package:flutter/material.dart';
import 'package:fruitify/features/auth/presentation/views/login_view.dart';
import 'package:fruitify/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruitify/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruitify/features/home/presentation/views/home_view.dart';
import 'package:fruitify/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:fruitify/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return MaterialPageRoute(builder: (_) => const SplashView());
    case 'onBoardingView':
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case 'loginView':
      return MaterialPageRoute(builder: (_) => const LoginView());
    case 'HomeView':
      return MaterialPageRoute(builder: (_) => const HomeView());
      case 'best_selling_view':
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case 'signUpView':
      return MaterialPageRoute(builder: (_) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
