import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';

class BottomText extends StatelessWidget {
  const BottomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'agree'.tr(),
              style: AppTextStyle.grey7w500size13(),
            ),
            TextSpan(
              text: 'term'.tr(),
              style: AppTextStyle.grey1w500size13(),
            ),
            TextSpan(
              text: 'and'.tr(),
              style: AppTextStyle.grey7w500size13(),
            ),
            TextSpan(
              text: 'privacy'.tr(),
              style: AppTextStyle.grey1w500size13(),
            ),
          ],
        ),
      ),
    );
  }
}
