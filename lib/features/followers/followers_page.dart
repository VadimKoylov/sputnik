import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/features/app/components/app_text_field.dart';
import 'package:sputnik/features/followers/store/followers_store.dart';
import 'package:sputnik/features/followers/widget/follower_cell.dart';

class FollowersPage extends StatefulWidget {
  static const String routeName = '/followersPage';

  const FollowersPage({Key? key}) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  late FollowersStore followersStore;

  @override
  void initState() {
    followersStore = context.read<FollowersStore>();
    followersStore.getFollowers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => followersStore.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : NestedScrollView(
                  floatHeaderSlivers: false,
                  physics: const ClampingScrollPhysics(),
                  headerSliverBuilder: ((context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        title: Text(
                          'followers'.tr(),
                          style: AppTextStyle.grey1w700size34(),
                        ),
                      ),
                      SliverAppBar(
                        primary: false,
                        forceElevated: true,
                        floating: true,
                        title: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.white3,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: AppTextField(
                            onChanged: null,
                            hint: 'search1',
                            fontSize: 17,
                            textAlignVertical: TextAlignVertical.center,
                            contentPadding: const EdgeInsets.only(left: 20),
                            suffixIcon: TextButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                'assets/icons/filter.svg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  }),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await followersStore.getFollowers();
                          },
                          child: followersStore.followers.isNotEmpty
                              ? ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: followersStore.followers.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        if (index == 0)
                                          const Divider(
                                            color: AppColors.white6,
                                            thickness: 1,
                                          ),
                                        const SizedBox(height: 20),
                                        FollowerCell(
                                          follower:
                                              followersStore.followers[index],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Divider(thickness: 2);
                                  },
                                )
                              : ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          'empty'.tr(),
                                          style: AppTextStyle.grey6w500size17(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
