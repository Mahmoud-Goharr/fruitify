import 'package:flutter/material.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  static const routeName = 'favoriteview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'المفضلة',
        showNotification: false,
      ),
      body: const FavoriteViewBody(),
    );
  }
}