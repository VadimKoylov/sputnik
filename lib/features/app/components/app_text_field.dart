import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/colors_light.dart';

class AppTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String hint;
  final double fontSize;
  final Widget? suffixIcon;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsets? contentPadding;
  final String? initialValue;

  const AppTextField({
    required this.onChanged,
    required this.hint,
    required this.fontSize,
    this.suffixIcon,
    this.textAlignVertical,
    this.contentPadding,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: TextStyle(
        color: AppColors.grey1,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      textAlignVertical: textAlignVertical,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hint.tr(),
        border: InputBorder.none,
        hintStyle: const TextStyle(
          color: AppColors.grey6,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
