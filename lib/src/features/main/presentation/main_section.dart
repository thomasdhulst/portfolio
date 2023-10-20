import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/my_tabs.dart';
import 'package:portfolio/src/features/main/presentation/main_section_desktop.dart';
import 'package:portfolio/src/features/main/presentation/main_section_tablet.dart';
import 'package:portfolio/src/features/main/presentation/widgets/end_drawer.dart';
import 'package:portfolio/src/features/main/presentation/widgets/safe_area.dart';
import 'package:portfolio/src/features/main/provider/scroll_controller.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class MainSection extends ConsumerStatefulWidget {
  const MainSection({super.key});

  @override
  ConsumerState<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends ConsumerState<MainSection> {
  bool _showScrollToTopFAB = false;

  void _displayScrollToTopFAB() {
    final scrollController = ref.watch(scrollControllerProvider);
    final scrollPosition = scrollController.position;

    if (scrollPosition.pixels > scrollPosition.minScrollExtent) {
      setState(() => _showScrollToTopFAB = true);
    } else {
      setState(() => _showScrollToTopFAB = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(scrollControllerProvider).addListener(_displayScrollToTopFAB);

    return DefaultTabController(
      // about, formation, experiences, projet
      length: MyTabs.nbrTab,
      child: Scaffold(
        floatingActionButton: _showScrollToTopFAB
            ? FloatingActionButton(
                onPressed: () => ref.watch(scrollControllerProvider).animateTo(
                      0,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.bounceIn,
                    ),
                tooltip: tr(LocaleKeys.scrollToTop),
                child: const Icon(Icons.keyboard_double_arrow_up),
              )
            : null,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        endDrawer: const MySafeArea(
          child: EndDrawer(),
        ),
        body: const MySafeArea(
          child: Responsive(
            desktop: MainDesktop(),
            tablet: MainTablet(),
          ),
        ),
      ),
    );
  }
}
