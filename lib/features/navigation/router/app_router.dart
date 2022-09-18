import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sputnik/core/di/injector.dart';
import 'package:sputnik/features/app/onboarding/onboarding.dart';
import 'package:sputnik/features/app/widgets/main.dart';
import 'package:sputnik/features/followers/followers_page.dart';
import 'package:sputnik/features/followers/store/followers_store.dart';
import 'package:sputnik/features/home/store/home_store.dart';
import 'package:sputnik/features/sign_in/store/sign_in_store.dart';
import 'package:sputnik/features/sign_in/sign_in_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Onboarding.routeName:
        return MaterialPageRoute(
          builder: (context) => Onboarding(),
        );

      case SignInPage.routeName:
        return MaterialPageRoute(
          builder: (context) => Provider(
            create: (context) => getIt.get<SignInStore>(),
            child: SignInPage(),
          ),
        );

      case MainPage.routeName:
        return MaterialPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              Provider(
                create: (context) => getIt.get<SignInStore>(),
              ),
              Provider(
                create: (context) => getIt.get<HomeStore>(),
              ),
              Provider(
                create: (context) => getIt.get<FollowersStore>(),
              ),
            ],
            child: MainPage(),
          ),
        );

      case FollowersPage.routeName:
        return MaterialPageRoute(
          builder: (context) => Provider(
            create: (context) => getIt.get<FollowersStore>(),
            child: FollowersPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
