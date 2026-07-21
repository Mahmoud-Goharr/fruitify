import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/helper/extensions.dart';
import 'package:fruitify/core/widgets/custom_bottom.dart';
import 'package:fruitify/core/widgets/custom_text_form_field.dart';
import 'package:fruitify/core/widgets/password_field.dart';
import 'package:fruitify/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruitify/features/auth/presentation/views/login_view.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/dont_have_acount.dart';
import 'package:fruitify/features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email;
  late String password;
  late String name;
  late bool isTermsAccepted = false;

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
                  name = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),

              SizedBox(height: 16.h),

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

              SizedBox(height: 30.h),

              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),

              SizedBox(height: 30.h),

              CustomBottom(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    if (isTermsAccepted) {
                      context.read<SignUpCubit>().signUpWithEmail(
                            email,
                            password,
                            name,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'يجب الموافقة على الشروط والأحكام',
                          ),
                        ),
                      );
                      return;
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: ' إنشاء حساب جديد',
              ),

              SizedBox(height: 26.h),

              DontHaveAccount(
                ontap: () {
                  Navigator.pop(
                    context,
                    LoginView.routeName,
                  );
                },
                text1: 'تمتلك حساب بالفعل ؟',
                text2: ' تسجيل الدخول',
              ),
            ],
          ),
        ),
      ),
    );
  }
}