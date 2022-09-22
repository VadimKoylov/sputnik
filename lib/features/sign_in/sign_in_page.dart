import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/core/data_base/storage.dart';
import 'package:sputnik/features/app/components/app_button.dart';
import 'package:sputnik/features/app/components/app_text_field.dart';
import 'package:sputnik/features/app/widgets/main.dart';
import 'package:sputnik/features/sign_in/store/sign_in_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sputnik/features/sign_in/widgets/bottom_text.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/signInPage';

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late SignInStore store;

  @override
  void initState() {
    store = context.read<SignInStore>();
    super.initState();
  }

  void goToNexPage() {
    Navigator.pushNamed(
      context,
      MainPage.routeName,
    );
  }

  void goToPreviousPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              final isFirstTime = await Storage.readFirstEnterCheck() ?? '';
              if (isFirstTime.isEmpty) {
                goToPreviousPage();
              } else {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else {
                  exit(0);
                }
              }
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Observer(
              builder: (_) => store.isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 50,
                            ),
                            child: Observer(
                              builder: (_) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'gitHubSocial'.tr(),
                                    style: AppTextStyle.grey1w700size34(),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'enterNicknameGit'.tr(),
                                    style: AppTextStyle.grey5w500size17(),
                                  ),
                                  const SizedBox(height: 45),
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.white3,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        top: 10,
                                        right: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'nickname'.tr(),
                                            style:
                                                AppTextStyle.grey4w500size10(),
                                          ),
                                          AppTextField(
                                            onChanged: store.setNickname,
                                            initialValue: store.nickname,
                                            hint: 'enterNickname',
                                            fontSize: 36,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (store.fail)
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 40.0),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/warning.svg',
                                              height: 100,
                                              width: 100,
                                            ),
                                            const SizedBox(height: 17),
                                            Text(
                                              'notFound'.tr(),
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppTextStyle.redw500size24(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  const Spacer(),
                                  Container(
                                    height: 60,
                                    width: double.infinity,
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
                                    child: AppButton.regular(
                                      onPressed: store.nickname.isEmpty
                                          ? null
                                          : () async {
                                              await store.getProfile();
                                              if (store.isSuccess) {
                                                goToNexPage();
                                              }
                                            },
                                      title: 'search',
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  BottomText(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
