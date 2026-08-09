import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileToggleItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ProfileToggleItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.grey.shade300 : Colors.grey;
    final dividerColor = isDarkMode ? const Color(0xFF333333) : const Color(0xffF2F3F3);
    
    return Column(
      children: [
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(icon, colorFilter: ColorFilter.mode(
            isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
            BlendMode.srcIn,
          )),
          title: Text(title, style: TextStyle(color: textColor)),
          trailing: Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white, 
            inactiveThumbColor: Colors.white, 
            activeTrackColor: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade400,
            inactiveTrackColor: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        Divider(color: dividerColor, height: 1),
      ],
    );
  }
}
