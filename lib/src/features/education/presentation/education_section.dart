import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/education/presentation/education_desktop.dart';
import 'package:portfolio/src/features/education/presentation/education_mobile.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class EducationSection extends ConsumerWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(
      desktop: EducationDesktop(),
      tablet: EducationMobile(),
      mobile: EducationMobile(),
    );
  }
}
