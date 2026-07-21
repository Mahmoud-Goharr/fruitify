import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruitify/core/assets.dart';
import 'package:fruitify/core/helper/get_user.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0XFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.assetsImagesNotification),
      ),
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: const Color(0XFF949D9E)),
      ),
      subtitle: Text(
        user?.name ?? '',
        style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
    );
  }
}
