import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/assets/colors_light.dart';
import 'package:sputnik/core/models/repositories_model.dart';
import 'package:sputnik/features/home/widgets/stars.dart';

class RepoCell extends StatelessWidget {
  final RepositoriesModel repo;

  const RepoCell({
    required this.repo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/js_logo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 10),
              Stars(starCount: repo.stargazersCount.toString()),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                width: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repo.name ?? 'Repo Name',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.grey1w500size17(),
                    ),
                    Text(
                      repo.id.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.grey3w500size10(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 25,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: AppColors.grey1,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 7.5),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/git_fork.svg'),
                      const SizedBox(width: 10),
                      Text(
                        (repo.forks ?? 0).toString(),
                        style: AppTextStyle.white1w500size10(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
