import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/education/domain/education.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/features/education/presentation/widgets/education_date_text.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';

class EducationCard extends ConsumerWidget {
  const EducationCard({super.key, required this.education});

  final Education education;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.textable,
        onTap: () => _onTap(context),
        borderRadius: BorderRadius.circular(20),
        hoverColor: theme.colorScheme.tertiary.withAlpha(40),
        splashColor: theme.colorScheme.tertiary.withAlpha(30),
        highlightColor: theme.colorScheme.tertiary.withAlpha(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.basic,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        education.title ?? "",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    gapW24,
                    if (!Responsive.isMobile(context))
                      EducationDateText(education: education),
                  ],
                ),
                if (Responsive.isMobile(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        education.school ?? "",
                        style: theme.textTheme.titleMedium,
                      ),
                      gapH4,
                      EducationDateText(education: education),
                    ],
                  )
                else
                  Text(
                    education.school ?? "",
                    style: theme.textTheme.titleMedium,
                  ),
                gapH8,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        education.description ?? "",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) async {
    final url = education.url;
    if (url == null) return;
    try {
      await LaunchUrlHelper.launchURL(url);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessengerHelper.showLaunchUrlError(context, url: url);
      }
    }
  }
}
