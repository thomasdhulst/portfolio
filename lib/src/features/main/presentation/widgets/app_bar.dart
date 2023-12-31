import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:portfolio/src/common/data/language_repository.dart';
import 'package:portfolio/src/common/widgets/animated_fade_slide.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/constants/my_tabs.dart';
import 'package:portfolio/src/features/main/presentation/widgets/app_bar_button.dart';
import 'package:portfolio/src/features/main/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/main/presentation/widgets/locale_button.dart';
import 'package:portfolio/src/features/main/provider/dark_mode_controller.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/features/main/provider/section_key_provider.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({super.key});

  bool _isDarkModeEnabled(WidgetRef ref) {
    return ref.watch(darkModeProvider).maybeWhen(
          data: (darkMode) => darkMode,
          orElse: () => ThemeMode.system == ThemeMode.dark,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MySelectionArea(
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: false,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _scrollToTop(context, ref),
            child: SizedBox(
              height: 56,
              child: SelectionContainer.disabled(
                child: AnimatedFadeSlide(
                  offset: const Offset(-64, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const Icon(FontAwesomeIcons.terminal),
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        semanticsLabel: 'TD Logo',
                        fit: BoxFit.contain,
                        width: 54,
                        height: 24,
                        colorFilter: _isDarkModeEnabled(ref)
                            ? const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Text(tr(LocaleKeys.portfolio)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          if (Responsive.isDesktop(context))
            AnimatedFadeSlide(
              offset: const Offset(64, 0),
              child: Row(
                children: [
                  AppBarButton(
                    title: tr(LocaleKeys.aboutSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(ref.watch(aboutSectionKeyProvider));
                    },
                  ),
                  AppBarButton(
                    title: tr(LocaleKeys.educationSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(
                          ref.watch(educationSectionKeyProvider));
                    },
                  ),
                  AppBarButton(
                    title: tr(LocaleKeys.experienceSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(
                        ref.watch(experienceSectionKeyProvider),
                      );
                    },
                  ),
                  AppBarButton(
                    title: tr(LocaleKeys.projectsSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(ref.watch(projectSectionKeyProvider));
                    },
                  ),
                  _buildLocaleButton(context, ref),
                  gapW8,
                  const DarkModeSwitch(),
                  gapW8,
                ],
              ),
            ),
        ],
        bottom: Responsive.isDesktop(context)
            ? null
            : TabBar(
                isScrollable: true,
                tabs: List.generate(
                  MyTabs.nbrTab,
                  (index) => Tab(
                    text: tr(MyTabs.names[index]),
                  ),
                ),
              ),
      ),
    );
  }

  void _scrollToTop(BuildContext context, WidgetRef ref) {
    if (Responsive.isDesktop(context)) {
      _onAppBarButtonTap(ref.watch(aboutSectionKeyProvider));
    } else {
      _onAppBarButtonTap(ref.watch(homeSectionKeyProvider));
    }
  }

  void _onAppBarButtonTap(GlobalKey sectionKey) {
    final sectionKeyCurrentContext = sectionKey.currentContext;
    if (sectionKeyCurrentContext != null) {
      Scrollable.ensureVisible(
        sectionKeyCurrentContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  Widget _buildLocaleButton(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageRepositoryProvider).getLanguages();
    if (languages.length > 1) return const LocaleButton();
    return const SizedBox.shrink();
  }
}
