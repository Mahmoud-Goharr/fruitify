import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/helper/snak_bar_failuer.dart';
import 'package:fruitify/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'تم إنشاء الحساب بنجاح',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                elevation: 8,
                margin: EdgeInsets.all(16.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
        }

        if (state is SignUpFailure) {
          snak_bar_failuer(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}