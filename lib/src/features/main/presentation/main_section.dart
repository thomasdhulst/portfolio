import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/tab_bar.dart';
import 'package:portfolio/src/features/main/presentation/main_section_desktop.dart';
import 'package:portfolio/src/features/main/presentation/main_section_tablet.dart';
import 'package:portfolio/src/features/main/presentation/widgets/bottom_banner.dart';
import 'package:portfolio/src/features/main/presentation/widgets/end_drawer.dart';
import 'package:portfolio/src/features/main/presentation/widgets/safe_area.dart';
import 'package:portfolio/src/features/main/provider/scroll_controller.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class MainSection extends ConsumerStatefulWidget {
  const MainSection({super.key});

  @override
  ConsumerState<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends ConsumerState<MainSection> {
  double _bottomBannerHeight = 0;
  bool _showScrollToTopFAB = false;

  void _displayBottomBanner() {
    final scrollController = ref.watch(scrollControllerProvider);
    final scrollPosition = scrollController.position;
    if (scrollPosition.pixels >= scrollPosition.maxScrollExtent - 64) {
      setState(() => _bottomBannerHeight = 48);
    } else {
      setState(() => _bottomBannerHeight = 0);
    }
  }

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
    ref.watch(scrollControllerProvider).addListener(_displayBottomBanner);
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
                // TODO(ah): trad
                tooltip: 'Go to up',
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
