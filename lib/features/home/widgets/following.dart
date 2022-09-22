import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/models/following_model.dart';
import 'package:sputnik/features/home/widgets/following_cell.dart';

class Following extends StatelessWidget {
  final List<FollowingModel> following;

  const Following({
    required this.following,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'followingYou'.tr(),
              style: AppTextStyle.grey1w700size34(),
            ),
            if (following.isNotEmpty)
              Flexible(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'viewAll'.tr(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: AppTextStyle.grey1w400size15Underline(),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: following.isNotEmpty
              ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: following.length,
                  itemBuilder: (context, index) {
                    return FollowingCell(following: following[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 20);
                  },
                )
              : Center(
                  child: Text(
                    'empty'.tr(),
                    style: AppTextStyle.grey6w500size17(),
                  ),
                ),
        ),
      ],
    );
  }
}
