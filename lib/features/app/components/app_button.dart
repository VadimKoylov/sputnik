import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  final TextStyle? textStyle;
  final Widget? child;

  const AppButton({
    required this.onPressed,
    this.title,
    this.child,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  AppButton.follow({
    required this.onPressed,
    required this.title,
    this.textStyle,
    Key? key,
  })  : child = Text(
          title!.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.white1w700size10(),
        ),
        super(key: key);

  AppButton.regular({
    required this.onPressed,
    required this.title,
    this.textStyle,
    Key? key,
  })  : child = Text(
          title!.tr(),
          style: AppTextStyle.white1w700size17(),
        ),
        super(key: key);

  const AppButton.viewAll({
    required this.onPressed,
    required this.child,
    this.title,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  const AppButton.profile({
    required this.onPressed,
    required this.child,
    this.title,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      disabledColor: AppColors.grey8,
      disabledTextColor: AppColors.white5,
      onPressed: onPressed,
      child: child,
    );
  }
}
