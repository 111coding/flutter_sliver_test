import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/sliver/hard_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/middle_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/tab_sliver_app_bar.dart';

class HardSliverPage extends StatefulWidget {
  const HardSliverPage({Key? key}) : super(key: key);

  @override
  State<HardSliverPage> createState() => _HardSliverPageState();
}

class _HardSliverPageState extends State<HardSliverPage> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            // TransitionSliver or TransitionSliverV2
            HardSliverAppBar(
              profileImage: Image.network("https://cdn.pixabay.com/photo/2019/02/06/09/36/lionel-messi-3978746__340.jpg", fit: BoxFit.fill),
              username: "Messi",
              token: "vsnkvsdnvklsnvklsjklvds",
            ),
            // 스크롤 될곳
            const MiddleSliverAppBar(),

            // 고정될곳
            TabSliverAppBar(tabController: tabController),
          ];
        },
        // 메인
        body: TabBarView(
          controller: tabController,
          children: List.generate(
              3,
              (index) => ListView.builder(
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
                  )),
        ),
      ),
    );
  }
}
