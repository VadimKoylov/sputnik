import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/features/app/components/app_button.dart';

class CategoryButton extends StatelessWidget {
  final String icon;
  final String title;

  const CategoryButton({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.white7,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey9.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 100,
            offset: const Offset(0, 80),
          ),
        ],
      ),
      child: AppButton.profile(
        onPressed: () {},
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 10),
            Text(
              title.tr(),
              style: AppTextStyle.grey1w500size15(),
            ),
          ],
        ),
      ),
    );
  }
}
