import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/models/following_model.dart';

class FollowingCell extends StatelessWidget {
  final FollowingModel following;

  const FollowingCell({
    required this.following,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            following.avatarUrl,
            width: 120,
            height: 120,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          following.login,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.grey1w500size17(),
        ),
        Text(
          following.id.toString(),
          style: AppTextStyle.grey3w500size10(),
        ),
      ],
    );
  }
}
