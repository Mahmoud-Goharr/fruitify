import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/core/widgets/notification_widget.dart';

AppBar buildAppbar(
  BuildContext context, {
  required String title,
  bool showBackButton = true,
  bool showNotification = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    ),
    centerTitle: true,
    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold19),
  );
}
