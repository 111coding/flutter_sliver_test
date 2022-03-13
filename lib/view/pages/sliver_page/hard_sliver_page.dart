import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/domain/model/user.dart';
import 'package:sliver_test/view/components/btn/icon_btn_menu.dart';
import 'package:sliver_test/view/components/drawer/common_drawer.dart';
import 'package:sliver_test/view/components/sliver/hard_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/middle_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/tab_sliver_app_bar.dart';
import 'package:sliver_test/view/pages/sliver_page/component/art_view.dart';
import 'package:sliver_test/view/pages/sliver_page/component/game_view.dart';
import 'package:sliver_test/view/pages/sliver_page/component/token_view.dart';

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
      key: IconBtnMenu.scaffoldKey,
      endDrawer: CommonDrawer(
        profileImage: Image.network(User.test().profileSrc, fit: BoxFit.fill),
        username: User.test().username,
        token: User.test().token,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            // TransitionSliver or TransitionSliverV2
            HardSliverAppBar(
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
      ),
    );
  }
}
