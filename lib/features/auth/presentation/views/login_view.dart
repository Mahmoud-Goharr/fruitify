import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/services/get_it_service.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/core/widgets/login_view_body_bloc_consumer.dart';
import 'package:fruitify/features/auth/doamin/repos/auth_rebo.dart';
import 'package:fruitify/features/auth/presentation/cubits/log_in_.dart/log_in_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'loginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state is LogInSuccess) {
            Navigator.of(context).pushReplacementNamed(LoginView.routeName);
          }
          if (state is LogInFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(context, title: 'تسجيل دخول'),
            body: LogInViewBodyConsumer(),
          );
        },
      ),
    );
  }
}
