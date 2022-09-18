import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';

class Stars extends StatelessWidget {
  final String starCount;

  const Stars({
    required this.starCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: AppColors.gold,
        ),
        const SizedBox(width: 2),
        Text(
          starCount,
          style: AppTextStyle.goldw600size10(),
        )
      ],
    );
  }
}
