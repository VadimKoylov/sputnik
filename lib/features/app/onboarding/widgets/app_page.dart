import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sputnik/core/assets/app_text_style.dart';

class AppPage extends StatelessWidget {
  final String svgPath;
  final String title;

  const AppPage({
    required this.svgPath,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(svgPath),
        ),
        Text(
          title.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.grey1w700size22(),
        ),
      ],
    );
  }
}
