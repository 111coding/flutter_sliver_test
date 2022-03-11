import 'package:flutter/material.dart';
import 'dart:math' as math;

class EasySliverPage extends StatefulWidget {
  const EasySliverPage({Key? key}) : super(key: key);

  @override
  State<EasySliverPage> createState() => _EasySliverPageState();
}

class _EasySliverPageState extends State<EasySliverPage> with TickerProviderStateMixin {
  late ScrollController sc = ScrollController()
    ..addListener(() {
      // print(sc.offset + MediaQuery.of(context).padding.top);
    });
  late TabController tabController = TabController(length: 2, vsync: this);

  double appbarHeight = 300;
  double fixedHeight = 56;
  double appbarOffset = 1;

  late ScrollController scrollController = ScrollController()
    ..addListener(() {
      final newOffset = (appbarHeight - scrollController.offset - 56) / (appbarHeight - 56);
      appbarOffset = newOffset < 0 ? 0 : newOffset;
      print(appbarOffset);
      setState(() {});
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: fixedHeight,
                color: Colors.blue,
                child: Opacity(
                  opacity: 1 - appbarOffset,
                  child: Row(
                    children: [
                      Text("PORTFOLIO"),
                    ],
                  ),
                ),
              ),
            ],
            flexibleSpace: Opacity(
              opacity: appbarOffset,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(width: 150 * appbarOffset, height: 150 * appbarOffset, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                  // Container(width: 100, height: 100, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                  Text("2"),
                  Text("3"),
                ],
              ),
            ),
            backgroundColor: Colors.red,
            expandedHeight: appbarHeight,
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
              )
            ]),
          ),
        ],
      )),
    );
  }
}
