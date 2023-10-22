import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/main/presentation/widgets/app_bar.dart';

class MySliverAppBar extends ConsumerWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPersistentHeader(
      delegate: _AppBarDelegate(),
      pinned: true,
    );
  }
}

class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const MyAppBar();
  }

  @override
  double get minExtent => 100;

  @override
  double get maxExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
