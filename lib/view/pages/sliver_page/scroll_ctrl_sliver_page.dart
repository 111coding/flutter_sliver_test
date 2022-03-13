import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/user.dart';
import 'package:sliver_test/view/components/btn/icon_btn_menu.dart';
import 'package:sliver_test/view/components/drawer/common_drawer.dart';

import 'package:sliver_test/view/pages/sliver_page/component/art/art_view.dart';
import 'package:sliver_test/view/pages/sliver_page/component/game_view.dart';
import 'package:sliver_test/view/pages/sliver_page/component/sliver/middle_sliver_app_bar.dart';
import 'package:sliver_test/view/pages/sliver_page/component/sliver/scroll_sliver_app_bar.dart';
import 'package:sliver_test/view/pages/sliver_page/component/sliver/tab_sliver_app_bar.dart';
import 'package:sliver_test/view/pages/sliver_page/component/token/token_view.dart';

class ScrollCtrlSliverPage extends StatefulWidget {
  const ScrollCtrlSliverPage({Key? key}) : super(key: key);

  @override
  State<ScrollCtrlSliverPage> createState() => _ScrollCtrlSliverPageState();
}

class _ScrollCtrlSliverPageState extends State<ScrollCtrlSliverPage> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: IconBtnMenu.scaffoldKey,
        endDrawer: CommonDrawer(
          profileImage: Image.network(User.test().profileSrc, fit: BoxFit.fill),
          username: User.test().username,
          token: User.test().token,
        ),
        body: NestedScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              ScrollSliverAppBar(
                scrollController: scrollController,
                profileImage: Image.network(User.test().profileSrc, fit: BoxFit.fill),
                username: User.test().username,
                token: User.test().token,
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
            children: const [
              TokenView(),
              ArtView(),
              GameView(),
            ],
          ),
        ));
  }
}
