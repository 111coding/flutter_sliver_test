import 'package:flutter/material.dart';
import 'package:sliver_test/view/components/sliver/middle_sliver_app_bar.dart';
import 'dart:math' as math;

import 'package:sliver_test/view/components/sliver/scroll_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/tab_sliver_app_bar.dart';

class ScrollCtrlSliverPage extends StatefulWidget {
  const ScrollCtrlSliverPage({Key? key}) : super(key: key);

  @override
  State<ScrollCtrlSliverPage> createState() => _ScrollCtrlSliverPageState();
}

class _ScrollCtrlSliverPageState extends State<ScrollCtrlSliverPage> with TickerProviderStateMixin {
  late ScrollController sc = ScrollController()
    ..addListener(() {
      // print(sc.offset + MediaQuery.of(context).padding.top);
    });
  late TabController tabController = TabController(length: 3, vsync: this);

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      slivers: [
        ScrollSliverAppBar(
          scrollController: scrollController,
          profileImage: Image.network("https://cdn.pixabay.com/photo/2019/02/06/09/36/lionel-messi-3978746__340.jpg", fit: BoxFit.fill),
          username: "Messi",
          token: "vsnkvsdnvklsnvklsjklvds",
        ),
        // 스크롤 될곳
        const MiddleSliverAppBar(),

        // 고정될곳
        TabSliverAppBar(tabController: tabController),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.blue,
            ),
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.green,
            ),
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.green,
            )
          ]),
        ),
      ],
    ));
  }
}
