import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/personal_info/data/personal_info_repository.dart';
import 'package:portfolio/src/features/personal_info/domain/resume.dart';
import 'package:portfolio/src/features/personal_info/presentation/widgets/contact_bar.dart';
import 'package:portfolio/src/features/personal_info/presentation/widgets/resume_button.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class PersonalInfoTablet extends ConsumerWidget {
  const PersonalInfoTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumes = ref.watch(personalInfoRepositoryProvider).getResumes();
    final contacts = ref.watch(personalInfoRepositoryProvider).getContacts();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 270,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/pdp.jpg',
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              gapW32,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      tr(LocaleKeys.name),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      tr(LocaleKeys.description),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gapH24,
                    Text(
                      tr(LocaleKeys.subDescription),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            _buildResumeButton(ref, resumes: resumes.toList()),
            gapW12,
            ContactBar(contacts: contacts.toList()),
          ],
        ),
      ],
    );
  }

  Widget _buildResumeButton(WidgetRef ref, {required List<Resume> resumes}) {
    if (resumes.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: ResumeButton(resumes: resumes),
    );
  }
}
