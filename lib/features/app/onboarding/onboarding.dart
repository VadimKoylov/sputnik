import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/core/data_base/storage.dart';
import 'package:sputnik/features/app/components/app_button.dart';
import 'package:sputnik/features/app/onboarding/widgets/app_page.dart';
import 'package:sputnik/features/sign_in/sign_in_page.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = '/onboarding';

  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white4,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  AppPage(
                    svgPath: 'assets/icons/onboarding_1.svg',
                    title: 'onboarding.1',
                  ),
                  AppPage(
                    svgPath: 'assets/icons/onboarding_2.svg',
                    title: 'onboarding.2',
                  ),
                  AppPage(
                    svgPath: 'assets/icons/onboarding_3.svg',
                    title: 'onboarding.3',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TabBar(
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
                indicator: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainWhite,
                ),
                controller: _tabController,
                tabs: List.generate(
                  3,
                  (index) => Tab(
                    key: ValueKey(index),
                    height: 30,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOutCubic,
                      decoration: BoxDecoration(
                        color: _tabController.index == index
                            ? AppColors.mainWhite
                            : AppColors.grey2,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: _tabController.index == index
                                ? AppColors.mainBlack
                                : AppColors.white4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.orange1,
                      AppColors.orange2,
                    ],
                  ),
                ),
                child: AppButton.regular(
                  onPressed: () {
                    if (_tabController.index == 2) {
                      Storage.writeFirstEnterCheck('value');
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        SignInPage.routeName,
                      );
                    } else {
                      _tabController.animateTo(_tabController.index + 1);
                    }
                  },
                  title: 'next',
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
