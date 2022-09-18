import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/features/app/components/app_button.dart';
import 'package:sputnik/features/followers/store/followers_store.dart';
import 'package:sputnik/features/home/store/home_store.dart';
import 'package:sputnik/features/home/widgets/following.dart';
import 'package:sputnik/features/home/widgets/repositories.dart';
import 'package:sputnik/features/sign_in/store/sign_in_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SignInStore signInStore;
  late HomeStore homeStore;
  late FollowersStore followersStore;

  @override
  void initState() {
    signInStore = context.read<SignInStore>();
    homeStore = context.read<HomeStore>();
    followersStore = context.read<FollowersStore>();
    homeStore.getFollowing(signInStore.nickname);
    followersStore.setUser(signInStore.nickname);
    homeStore.getRepositories(signInStore.nickname);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              signInStore.profile!.login,
              style: AppTextStyle.grey1w700size34(),
            ),
            SizedBox(
              child: Container(
                height: 42,
                width: 116,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.orange2,
                      AppColors.orange1,
                    ],
                  ),
                ),
                child: AppButton.follow(
                  onPressed: () {},
                  title: 'follow'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => homeStore.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'company'.tr() + (signInStore.profile!.company ?? ''),
                          style: AppTextStyle.grey6w500size17(),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'email'.tr() + (signInStore.profile!.email ?? ''),
                          style: AppTextStyle.grey6w500size17(),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'bio'.tr() + (signInStore.profile!.bio ?? ''),
                          style: AppTextStyle.grey6w500size17(),
                        ),
                        const Divider(thickness: 1.5),
                        SizedBox(
                          height: 250,
                          child: Following(
                            following: homeStore.following.toList(),
                          ),
                        ),
                        const Divider(thickness: 1.5),
                        SizedBox(
                          height: 250,
                          child: Repositories(
                            repositories: homeStore.repositories.toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
