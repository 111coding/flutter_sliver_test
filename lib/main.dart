import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sliver_test/scroll_sliver_delegate.dart';
import 'package:sliver_test/transition_sliver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late ScrollController sc = ScrollController()
    ..addListener(() {
      // print(sc.offset + MediaQuery.of(context).padding.top);
    });
  late TabController tabController = TabController(length: 2, vsync: this);

  double appbarHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: sc,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            TransitionSliver(
              // extent: 250,
              extent: 300,

              avatar: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
              ),
              username: "Lee J",
              token: "faighdkghdklsfaskf",
            ),

            // 스크롤 될곳
            SliverFixedExtentList(
              itemExtent: 200.0,
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // 고정될곳
            SliverPersistentHeader(
              pinned: true,
              delegate: ScrollSliverDelegate(
                minHeight: 42.0,
                maxHeight: 42.0,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    controller: tabController,
                    indicatorColor: Colors.blue,
                    indicatorWeight: 3,
                    tabs: [
                      Text("적립내역"),
                      Text("기부내역"),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        // 메인
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 24),
                itemBuilder: (context, index) {
                  return Container(
                    height: 74,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network("https://pbs.twimg.com/profile_images/1368078949058703361/fajS1ghF_400x400.jpg", fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("와이드 베이직 티셔츠"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 24),
                itemCount: 100),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                    ),
                    title: Text("test"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
