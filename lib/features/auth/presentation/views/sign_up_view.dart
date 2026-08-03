import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/services/get_it_service.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/features/auth/doamin/repos/auth_rebo.dart';
import 'package:fruitify/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(context, title: 'حساب جديد'),
            body: const SignupViewBodyBlocConsumer(),
          );
        },
      ),
    );
  }
}
