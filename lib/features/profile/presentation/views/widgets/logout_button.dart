import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitify/core/services/supabase_auth_service.dart';
import 'package:fruitify/core/utils/app_images.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/custom_button.dart';
import 'package:fruitify/features/auth/presentation/views/login_view.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم ألوان الثيم التي قمنا بتعريفها
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // الألوان للزر الخارجي (الذي يضغط عليه المستخدم)
    final outerBtnColor = isDarkMode
        // ignore: deprecated_member_use
        ? const Color(0xFF1B5E37).withOpacity(0.2)
        : const Color(0xFFE8F5E9);
    final outerTextColor = isDarkMode
        ? Colors.green[300]
        : const Color(0xff1B5E37);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // نأخذ إعدادات الدايلوج من الثيم
            final dialogTheme = Theme.of(context).dialogTheme;

            return Dialog(
              // لا نضع خلفية هنا، نترك الثيم يتحكم
              insetPadding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: dialogTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close),
                      ),

                      const Gap(8),

                      Center(
                        child: Text(
                          'هل ترغب في تسجيل الخروج ؟',
                          style: TextStyles.bold16.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                      ),

                      const Gap(24),

                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () async {
                                await SupabaseAuthService(
                                  Supabase.instance.client.auth,
                                ).signOut();

                                if (!context.mounted) return;

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginView.routeName,
                                  (route) => false,
                                );
                              },
                              text: 'تأكيد',
                            ),
                          ),

                          const Gap(12),

                          Expanded(
                            child: CustomButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'لا أرغب',
                              color: isDarkMode
                                  ? const Color(0xFF3A3A3A)
                                  : const Color(0xFFF2F3F3),
                              textColor: isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        // ... كود الزر الخارجي كما هو ...
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: outerBtnColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'تسجيل الخروج',
              style: TextStyles.semiBold13.copyWith(color: outerTextColor),
            ),
            Positioned(
              left: 33,
              child: SvgPicture.asset(
                Assets.imagesProfileIconsLogout,
                colorFilter: ColorFilter.mode(outerTextColor!, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
