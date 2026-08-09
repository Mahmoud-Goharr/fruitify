import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitify/core/helper/on_generate_route.dart';
import 'package:fruitify/core/services/custom_bloc_observer.dart';
import 'package:fruitify/core/services/get_it_service.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/features/home/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:fruitify/features/splash/presentation/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  await prehs.init();

  setupGetit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (_) => FavoriteCubit(),
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),

            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            supportedLocales: S.delegate.supportedLocales,

            locale: const Locale('ar'),

            debugShowCheckedModeBanner: false,

            onGenerateRoute: onGenerateRoute,

            initialRoute: SplashView.routeName,
          ),
        );
      },
    );
  }
}