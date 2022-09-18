import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/models/follower_model.dart';

class FollowerCell extends StatelessWidget {
  final FollowerModel follower;

  const FollowerCell({
    required this.follower,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              follower.avatarUrl,
              width: 58,
              height: 58,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                follower.login,
                style: AppTextStyle.grey1w700size20(),
              ),
              const SizedBox(height: 5),
              Text(
                follower.id.toString(),
                style: AppTextStyle.grey1w500size17(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
