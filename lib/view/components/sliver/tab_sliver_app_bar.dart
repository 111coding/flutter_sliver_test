import 'dart:math';

import 'package:flutter/material.dart';

class TabSliverAppBar extends StatelessWidget {
  const TabSliverAppBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TabSliverDelegate(
        minHeight: 60.0,
        maxHeight: 60.0,
        tabController: tabController,
      ),
    );
  }
}

class _TabSliverDelegate extends SliverPersistentHeaderDelegate {
  _TabSliverDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.tabController,
  });

  final double minHeight;
  final double maxHeight;
  final TabController tabController;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  final _menus = ["TOKEN", "ART", "GAME"];

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        Expanded(child: Container(color: Colors.white)),
        Container(
          color: Colors.white,
          height: maxHeight * 0.7,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 3,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 24),
              ),
              Container(
                height: maxHeight * 0.7,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  controller: tabController,
                  indicatorColor: Colors.black,
                  indicatorWeight: 3,
                  tabs: _menus.map((m) => Text(m, style: const TextStyle(color: Colors.black))).toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(_TabSliverDelegate oldDelegate) => true;
}
