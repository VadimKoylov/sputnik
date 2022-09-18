import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  static const String routeName = '/changeLanguagePage';

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  late Locale currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentLocale = context.locale;
  }

  final Map<String, Locale> languageList = {
    'English': const Locale('en', 'US'),
    'Russian': const Locale('ru', 'RU'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          'meta.language'.tr(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => RadioListTile(
                value: languageList.values.elementAt(index),
                groupValue: currentLocale,
                onChanged: (value) async {
                  context.setLocale(
                    languageList.values.elementAt(index),
                  );
                  setState(() {
                    currentLocale = languageList.values.elementAt(index);
                  });
                  Navigator.pop(context);
                },
                title: Text(
                  languageList.keys.elementAt(index),
                ),
              ),
              childCount: languageList.length,
            ),
          )
        ],
      ),
    );
  }
}
