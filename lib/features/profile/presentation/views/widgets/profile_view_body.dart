import 'package:flutter/material.dart';
import 'package:fruitify/constants.dart';
import 'package:fruitify/core/utils/app_images.dart';
import 'package:fruitify/core/widgets/custom_appbar.dart';
import 'package:fruitify/features/profile/presentation/views/who_are_we_view.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/profile_item_sliver_list.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/profile_menu_item.dart';
import 'package:fruitify/features/profile/presentation/views/widgets/section_title.dart';
import 'package:gap/gap.dart';


class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
  }

 @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: kTopPaddding,
                  ),
                  child: customAppBar(
                    context,
                    title: 'حسابي',
                    showBackButton: false,
                    showNotification: false,
                  ),
                ),
              ),

              const SliverToBoxAdapter(
                child: Gap(16),
              ),

              const SliverToBoxAdapter(
                child: ProfileHeader(),
              ),

              const SliverToBoxAdapter(
                child: Gap(16),
              ),

              const SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'عام',
                ),
              ),

              const SliverToBoxAdapter(
                child: Gap(16),
              ),

              ProfileItemSliverList(),

              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),

              const SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'المساعده',
                ),
              ),

              const SliverToBoxAdapter(
                child: Gap(16),
              ),

              SliverToBoxAdapter(
                child: ProfileMenuItem(
                  icon: Assets.imagesProfileIconsVuesaxOutlineUser,
                  title: 'من نحن',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      WhoAreWeView.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        LogoutButton(),

        const Gap(33),
      ],
    ),
  );
}
}
