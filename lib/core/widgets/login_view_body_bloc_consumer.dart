import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/helper/snak_bar_failuer.dart';
import 'package:fruitify/core/widgets/custom_progress_hud.dart';
import 'package:fruitify/features/auth/presentation/cubits/log_in_.dart/log_in_cubit.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruitify/features/home/presentation/views/main_view.dart';

class LogInViewBodyConsumer extends StatelessWidget {
  const LogInViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            (context),
            MainView.routeName,
            (route) => false,
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'تم تسجيل الدخول بنجاح',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                elevation: 8,
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                duration: Duration(seconds: 2),
              ),
            );
        }
        if (state is LogInFailure) {
          snakBarFailuer(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LogInLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
