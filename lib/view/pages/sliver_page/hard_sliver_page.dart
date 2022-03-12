import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/sliver/hard_sliver_app_bar.dart';
import 'package:sliver_test/view/pages/sliver_page/sliver_delegate/scroll_sliver_delegate.dart';

class HardSliverPage extends StatefulWidget {
  const HardSliverPage({Key? key}) : super(key: key);

  @override
  State<HardSliverPage> createState() => _HardSliverPageState();
}

class _HardSliverPageState extends State<HardSliverPage> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
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
            SliverFixedExtentList(
              itemExtent: 200.0,
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(gradient: ColorPallete.mainLinearGradient),
                          width: double.infinity,
                          height: 200,
                          child: Column(
                            children: [
                              Text("1"),
                              Text("2"),
                              Text("3"),
                            ],
                          ),
                        ),
                      ],
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
