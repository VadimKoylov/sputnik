import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sputnik/core/data_base/storage.dart';
import 'package:sputnik/core/di/injector.dart';
import 'package:sputnik/features/app/widgets/core_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies(env: Environment.test);
  await EasyLocalization.ensureInitialized();
  final String isFirstTime = await Storage.readFirstEnterCheck() ?? '';

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/lang',
      child: CoreApp(isFirstTime: isFirstTime.isEmpty),
    ),
  );
}
