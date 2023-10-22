import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/features/about/presentation/about_section.dart';
import 'package:portfolio/src/features/education/presentation/education_section.dart';
import 'package:portfolio/src/features/experience/presentation/experience_section.dart';
import 'package:portfolio/src/features/personal_info/presentation/personal_info_section.dart';
import 'package:portfolio/src/features/main/presentation/widgets/sliver_app_bar.dart';
import 'package:portfolio/src/features/project/presentation/project_section.dart';
import 'package:portfolio/src/features/main/provider/scroll_controller.dart';
import 'package:portfolio/src/features/main/provider/section_key_provider.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class MainTablet extends ConsumerStatefulWidget {
  const MainTablet({super.key});

  @override
  ConsumerState<MainTablet> createState() => _MainTabletState();
}

class _MainTabletState extends ConsumerState<MainTablet> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);

    return MySelectionArea(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            const MySliverAppBar(),
            SliverPadding(
              padding: _buildResponsivePadding(),
              sliver: SliverToBoxAdapter(
                child: PersonalInfoSection(
                  key: ref.watch(homeSectionKeyProvider),
                ),
              ),
            )
          ],
          body: Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 24, left: 24),
            child: TabBarView(
              children: [
                AboutSection(
                  key: ref.watch(aboutSectionKeyProvider),
                ),
                EducationSection(
                  key: ref.watch(educationSectionKeyProvider),
                ),
                ExperienceSection(
                  key: ref.watch(experienceSectionKeyProvider),
                ),
                ProjectSection(
                  key: ref.watch(projectSectionKeyProvider),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: _buildResponsivePadding(),
          //   child: CustomScrollView(
          //     slivers: [
          //       SliverList(
          //         delegate: SliverChildListDelegate([
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: 12),
          //             child: PersonalInfoSection(
          //               key: ref.watch(homeSectionKeyProvider),
          //             ),
          //           ),
          //           gapH24,
          //           Expanded(
          //             // height: 3500,
          //             child: TabBarView(
          //               children: [
          //                 AboutSection(
          //                   key: ref.watch(aboutSectionKeyProvider),
          //                 ),
          //                 EducationSection(
          //                   key: ref.watch(educationSectionKeyProvider),
          //                 ),
          //                 ExperienceSection(
          //                   key: ref.watch(experienceSectionKeyProvider),
          //                 ),
          //                 ProjectSection(
          //                   key: ref.watch(projectSectionKeyProvider),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ]),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  EdgeInsetsGeometry _buildResponsivePadding() {
    if (Responsive.isTablet(context)) {
      return const EdgeInsets.fromLTRB(48, 60, 48, 0);
    } else if (Responsive.isMobile(context)) {
      return const EdgeInsets.fromLTRB(20, 32, 20, 0);
    }
    return EdgeInsets.zero;
  }
}
