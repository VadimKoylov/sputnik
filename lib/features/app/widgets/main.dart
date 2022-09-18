import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/features/chat/chat_page.dart';
import 'package:sputnik/features/followers/followers_page.dart';
import 'package:sputnik/features/home/home_page.dart';
import 'package:sputnik/features/navigation/router/app_router.dart';
import 'package:sputnik/features/profile/profile_page.dart';

final firstTabNavKey = GlobalKey<NavigatorState>();
final secondTabNavKey = GlobalKey<NavigatorState>();
final thirdTabNavKey = GlobalKey<NavigatorState>();
final forthTabNavKey = GlobalKey<NavigatorState>();

class MainPage extends StatefulWidget {
  static const String routeName = '/mainPage';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: controller,
      tabBar: CupertinoTabBar(
        items: [
          NavBarItem(
            svgPath: 'assets/icons/home.svg',
            title: 'home',
            context: context,
          ),
          NavBarItem(
            svgPath: 'assets/icons/followers.svg',
            title: 'followers',
            context: context,
          ),
          NavBarItem(
            svgPath: 'assets/icons/chat.svg',
            title: 'chat',
            context: context,
          ),
          NavBarItem(
            svgPath: 'assets/icons/profile.svg',
            title: 'profile',
            context: context,
          ),
        ],
        inactiveColor: AppColors.grey4,
        activeColor: AppColors.grey1,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
                onGenerateRoute: Routes.generateRoute,
                navigatorKey: firstTabNavKey,
                builder: (context) {
                  return HomePage();
                });
          case 1:
            return CupertinoTabView(
              onGenerateRoute: Routes.generateRoute,
              navigatorKey: secondTabNavKey,
              builder: (context) {
                return FollowersPage();
              },
            );
          case 2:
            return CupertinoTabView(
              onGenerateRoute: Routes.generateRoute,
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) {
                return ChatPage();
              },
            );
          default:
            return CupertinoTabView(
              onGenerateRoute: Routes.generateRoute,
              navigatorKey: forthTabNavKey,
              builder: (context) {
                return ProfilePage();
              },
            );
        }
      },
    );
  }
}

class NavBarItem extends BottomNavigationBarItem {
  NavBarItem({
    required String svgPath,
    required String title,
    required BuildContext context,
  }) : super(
          icon: SvgPicture.asset(svgPath),
          activeIcon: SvgPicture.asset(
            svgPath,
            color: AppColors.grey1,
          ),
          label: title.tr(),
          backgroundColor: AppColors.grey4,
        );
}
