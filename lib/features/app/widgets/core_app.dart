import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/features/app/onboarding/onboarding.dart';
import 'package:sputnik/features/navigation/router/app_router.dart';
import 'package:sputnik/features/sign_in/sign_in_page.dart';

class CoreApp extends StatelessWidget {
  final bool isFirstTime;

  const CoreApp({
    required this.isFirstTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: isFirstTime ? Onboarding.routeName : SignInPage.routeName,
      theme: ThemeData(
        backgroundColor: AppColors.white1,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          color: AppColors.white1,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColors.grey1,
          ),
        ),
      ),
    );
  }
}
