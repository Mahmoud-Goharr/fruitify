import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileLanguageItem extends StatelessWidget {
  final String title;
  final String currentLang;
  final String icon;

  const ProfileLanguageItem({
    super.key,
    required this.title,
    required this.currentLang, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.grey.shade300 : Colors.grey;
    final langColor = isDarkMode ? Colors.grey.shade100 : Colors.black;
    final iconColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600;
    final dividerColor = isDarkMode ? const Color(0xFF333333) : const Color(0xffF2F3F3);
    
    return Column(
      children: [
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(icon, colorFilter: ColorFilter.mode(
            iconColor,
            BlendMode.srcIn,
          )),
          title: Text(title, style: TextStyle(color: textColor)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currentLang, style: TextStyle(color: langColor)),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
            ],
          ),
        ),
        Divider(color: dividerColor, height: 1),
      ],
    );
  }
}
