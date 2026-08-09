import 'package:flutter/material.dart';
import 'package:fruitify/core/helper/get_user.dart';
import 'package:fruitify/core/utils/app_colors.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:gap/gap.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    if (user == null) {
      return const SizedBox();
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final avatarBgColor = isDarkMode ? Colors.grey[700] : Colors.grey[300];

    final circleContainerColor = isDarkMode
        ? const Color(0xFF2A2A2A)
        : const Color(0xffF9F9F9);

    final nameTextColor = isDarkMode
        ? Colors.grey[100]
        : const Color(0xff131F46);

    final emailTextColor = isDarkMode
        ? Colors.grey[500]
        : const Color(0xff888FA0);

    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: avatarBgColor,
              child: Icon(
                Icons.person,
                color: isDarkMode ? Colors.grey[400] : Colors.black,
                size: 36,
              ),
            ),

            Positioned(
              bottom: -7,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: circleContainerColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),

        const Gap(21),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyles.bold13.copyWith(color: nameTextColor),
            ),

            const Gap(2),

            Text(
              user.email,
              style: TextStyles.regular13.copyWith(color: emailTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
