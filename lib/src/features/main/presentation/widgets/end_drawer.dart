import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/data/language_repository.dart';
import 'package:portfolio/src/common/widgets/animated_fade_slide.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/main/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/main/presentation/widgets/locale_button.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isDesktop(context)) return const SizedBox.shrink();
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          Divider(
            height: 8,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          Expanded(
            child: MySelectionArea(
              mouseCursor: MaterialStateMouseCursor.clickable,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gapH40,
                      const AnimatedFadeSlide(
                        offset: Offset(0, -64),
                        duration: Duration(milliseconds: 350),
                        child: DarkModeSwitch(),
                      ),
                      gapH80,
                      AnimatedFadeSlide(
                        offset: const Offset(0, 64),
                        duration: const Duration(milliseconds: 350),
                        child: _buildLocaleButton(context, ref),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocaleButton(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageRepositoryProvider).getLanguages();
    if (languages.length > 1) return const LocaleButton();
    return const SizedBox.shrink();
  }
}
