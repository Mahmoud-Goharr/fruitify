import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.grey.shade400 : const Color(0xff949D9E);
    final iconColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600;
    final arrowColor = isDarkMode ? Colors.grey.shade400 : Colors.black;
    final dividerColor = isDarkMode ? const Color(0xFF333333) : const Color(0xffF2F3F3);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: SvgPicture.asset(icon, colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          )),
          title: Text(
            title,
            style: TextStyles.semiBold13.copyWith(color: textColor),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: arrowColor,
          ),
        ),
        Divider(height: 1, color: dividerColor),
      ],
    );
  }
}
