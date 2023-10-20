import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  const factory Education({
    String? title,
    String? school,
    String? description,
    String? url,
    bool? isPresent,
    int? startYear,
    int? startMonth,
    int? endYear,
    int? endMonth,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
