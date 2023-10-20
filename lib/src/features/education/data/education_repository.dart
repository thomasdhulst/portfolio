import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/education/domain/education.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';
import 'package:portfolio/src/localization/locale_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'education_repository.g.dart';

@riverpod
EducationRepository educationRepository(EducationRepositoryRef ref) {
  return EducationRepository(ref);
}

class EducationRepository {
  EducationRepository(this._ref);

  final Ref _ref;

  List<Education> getEducations() {
    final locale = _ref.watch(localeControllerProvider).locale;
    final jsonEducations = trList(locale, LocaleKeys.educations);
    final educations = jsonEducations.map((jsonEducation) {
      return Education.fromJson(jsonEducation);
    }).toList();
    return educations;
  }
}
