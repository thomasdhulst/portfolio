import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/education/domain/education.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/utils/localized_date_extension.dart';
import 'package:portfolio/src/utils/string_extension.dart';

class EducationDateText extends ConsumerWidget {
  const EducationDateText({super.key, required this.education});

  final Education education;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale;
    final startMonth = education.startMonth?.localizedMonth(locale) ?? "";
    final startYear = education.startYear?.localizedYear(locale);
    final startDate = startMonth.isEmpty ? startYear : "$startMonth $startYear";
    final endMonth = education.endMonth?.localizedMonth(locale) ?? "";
    final endYear = education.endYear?.localizedYear(locale);
    String? endDate;
    if (education.isPresent == true) {
      endDate = tr(LocaleKeys.present);
    } else {
      endDate = endMonth.isEmpty ? endYear : "$endMonth $endYear";
    }
    if (startDate == null || endDate == null) return const Text("");
    return Text(
      "${startDate.capitalize()} - ${endDate.capitalize()}",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
