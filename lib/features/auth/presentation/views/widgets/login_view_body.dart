import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/assets.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/custom_bottom.dart';
import 'package:fruitify/core/widgets/custom_text_form_field.dart';
import 'package:fruitify/core/widgets/password_field.dart';
import 'package:fruitify/features/auth/presentation/cubits/log_in_.dart/log_in_cubit.dart';
import 'package:fruitify/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/dont_have_acount.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email;
  late String password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kHorizintalPadding.w,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24.h),

              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),

              SizedBox(height: 16.h),

              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 33.h),

              CustomBottom(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context.read<LogInCubit>().logInWithEmail(
                          email,
                          password,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),

              SizedBox(height: 33.h),

              DontHaveAccount(
                ontap: () {
                  Navigator.pushNamed(
                    context,
                    SignUpView.routeName,
                  );
                },
                text1: 'لا تمتلك حساب؟',
                text2: 'قم بإنشاء حساب',
              ),

              SizedBox(height: 33.h),

              const OrDivider(),

              SizedBox(height: 33.h),

              SocialLoginButton(
                onPressed: () {
                  context.read<LogInCubit>().logInWithGoogle();
                },
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),

              SizedBox(height: 16.h),

              SocialLoginButton(
                onPressed: () {
                  context.read<LogInCubit>().logInWithFacebook();
                },
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}