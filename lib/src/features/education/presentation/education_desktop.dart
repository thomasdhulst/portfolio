import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/education/data/education_repository.dart';
import 'package:portfolio/src/features/education/presentation/widgets/education_card.dart';

import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class EducationDesktop extends ConsumerWidget {
  const EducationDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final educations = ref.watch(educationRepositoryProvider).getEducations();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            tr(LocaleKeys.educationSectionTitle),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...educations.mapIndexed((index, education) {
          return Column(
            children: [
              EducationCard(education: education),
              if (index != educations.length - 1) gapH24,
            ],
          );
        }),
      ],
    );
  }
}
