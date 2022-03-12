import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sliver_test/view/components/scroll_sliver_app_bar.dart';

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
  late TabController tabController = TabController(length: 2, vsync: this);

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
