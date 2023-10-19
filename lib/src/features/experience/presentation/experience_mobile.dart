import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/experience/data/experience_repository.dart';
import 'package:portfolio/src/features/experience/presentation/widgets/experience_card.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class ExperienceMobile extends ConsumerWidget {
  const ExperienceMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences =
        ref.watch(experienceRepositoryProvider).getExperiences();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            tr(LocaleKeys.experienceSectionTitle),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) =>
                ExperienceCard(experience: experiences[index]),
            separatorBuilder: (context, index) => gapH24,
            itemCount: experiences.length,
          ),
        )
      ],
    );
  }
}
