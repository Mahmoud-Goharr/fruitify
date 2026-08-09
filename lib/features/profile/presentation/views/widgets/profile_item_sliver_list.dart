import 'package:flutter/material.dart';
import 'package:fruitify/core/utils/app_images.dart';
import 'package:fruitify/features/profile/presentation/views/favorite_view.dart';
import 'package:fruitify/features/profile/presentation/views/orders_view.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/profile_language_item.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/profile_menu_item.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/profile_toggle_item.dart';

class ProfileItemSliverList extends StatefulWidget {
  const ProfileItemSliverList({super.key});

  @override
  State<ProfileItemSliverList> createState() => _ProfileItemSliverListState();
}

class _ProfileItemSliverListState extends State<ProfileItemSliverList> {
  bool notificationToggle = false;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ProfileMenuItem(
          icon: Assets.imagesProfileIconsVuesaxOutlineUser,
          title: 'الملف الشخصي',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Assets.imagesProfileIconsVuesaxOutlineBox,
          title: 'طلباتي',
          onTap: () {
            Navigator.pushNamed(context, OrdersView.routeName);
          },
        ),

        ProfileMenuItem(
          icon: Assets.imagesProfileIconsVuesaxOutlineEmptyWallet,
          title: 'المدفوعات',
          onTap: () {},
        ),

        ProfileMenuItem(
          icon: Assets.imagesProfileIconsHeart,
          title: 'المفضلة',
          onTap: () {
            Navigator.pushNamed(context, FavoriteView.routeName);
          },
        ),

        ProfileToggleItem(
          icon: Assets.imagesProfileIconsNotification,
          title: 'الاشعارات',
          value: notificationToggle,
          onChanged: (value) {
            setState(() {
              notificationToggle = value;
            });
          },
        ),

        ProfileLanguageItem(
          title: 'اللغة',
          currentLang: 'العربية',
          icon: Assets.imagesProfileIconsGlobal,
        ),
      ]),
    );
  }
}
