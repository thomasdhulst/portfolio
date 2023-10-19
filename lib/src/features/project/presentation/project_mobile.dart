import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/data/project_repository.dart';
import 'package:portfolio/src/features/project/presentation/widgets/project_card.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class ProjectMobile extends ConsumerWidget {
  const ProjectMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectRepositoryProvider).getProjects();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            tr(LocaleKeys.projectsSectionTitle),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) =>
                ProjectCard(project: projects[index]),
            separatorBuilder: (context, index) => gapH24,
            itemCount: projects.length,
          ),
        )
      ],
    );
  }
}
