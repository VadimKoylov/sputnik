import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/features/app/components/app_button.dart';
import 'package:sputnik/features/profile/widgets/category_button.dart';
import 'package:sputnik/features/sign_in/store/sign_in_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final store = context.read<SignInStore>();
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (_) => store.isLoading && store.profile == null
              ? const CircularProgressIndicator.adaptive()
              : NestedScrollView(
                  floatHeaderSlivers: false,
                  physics: const ClampingScrollPhysics(),
                  headerSliverBuilder: ((context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.white3,
                              ),
                              child: PopupMenuButton<String>(
                                elevation: 10,
                                icon: const Icon(
                                  Icons.settings_rounded,
                                  color: AppColors.grey1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                onSelected: (value) async {
                                  switch (value) {
                                    case 'English':
                                      setState(() {
                                        context.setLocale(
                                          const Locale('en', 'US'),
                                        );
                                      });
                                      break;
                                    case 'Русский':
                                      setState(() {
                                        context.setLocale(
                                          const Locale('ru', 'RU'),
                                        );
                                      });
                                      break;
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return {
                                    'English',
                                    'Русский',
                                  }.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.white3,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/notification.svg',
                                  color: AppColors.grey1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ];
                  }),
                  body: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                store.profile!.avatarUrl!,
                                width: 165,
                                height: 165,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              store.profile!.name!,
                              style: AppTextStyle.grey1w700size34(),
                            ),
                            Text(
                              store.profile!.id.toString(),
                              style: AppTextStyle.grey9w500size17(),
                            ),
                            const SizedBox(height: 24),
                            CategoryButton(
                              icon: 'assets/icons/heart.svg',
                              title: 'myFollowing',
                            ),
                            const SizedBox(height: 20),
                            CategoryButton(
                              icon: 'assets/icons/heart.svg',
                              title: 'myFollowers',
                            ),
                            const SizedBox(height: 20),
                            CategoryButton(
                              icon: 'assets/icons/medal.svg',
                              title: 'myBadges',
                            ),
                            const SizedBox(height: 20),
                            CategoryButton(
                              icon: 'assets/icons/dollar.svg',
                              title: 'myOrganizations',
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 58,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColors.grey1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                              ),
                              child: AppButton.viewAll(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'viewAll'.tr(),
                                      style: AppTextStyle.white1w700size17(),
                                    ),
                                    const SizedBox(width: 13),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      color: AppColors.white4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
