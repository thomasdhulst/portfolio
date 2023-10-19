import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/project/presentation/project_desktop.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/features/project/presentation/project_mobile.dart';

class ProjectSection extends ConsumerWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(
      desktop: ProjectDesktop(),
      tablet: ProjectMobile(),
      mobile: ProjectMobile(),
    );
  }
}
