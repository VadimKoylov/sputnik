import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sputnik/core/assets/app_text_style.dart';
import 'package:sputnik/core/models/repositories_model.dart';
import 'package:sputnik/features/home/widgets/repo_cell.dart';

class Repositories extends StatelessWidget {
  final List<RepositoriesModel> repositories;

  const Repositories({
    required this.repositories,
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
              'repo'.tr(),
              style: AppTextStyle.grey1w700size34(),
            ),
            Flexible(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'viewAll'.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.grey1w400size15Underline(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: repositories.length,
            itemBuilder: (context, index) {
              return RepoCell(repo: repositories[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
          ),
        ),
      ],
    );
  }
}
