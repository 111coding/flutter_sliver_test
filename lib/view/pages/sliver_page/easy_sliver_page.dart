import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/user.dart';
import 'package:sliver_test/view/components/btn/icon_btn_menu.dart';
import 'package:sliver_test/view/components/drawer/common_drawer.dart';
import 'dart:math' as math;

import 'package:sliver_test/view/components/sliver/easy_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/middle_sliver_app_bar.dart';
import 'package:sliver_test/view/components/sliver/tab_sliver_app_bar.dart';

class EasySliverPage extends StatefulWidget {
  const EasySliverPage({Key? key}) : super(key: key);

  @override
  State<EasySliverPage> createState() => _EasySliverPageState();
}

class _EasySliverPageState extends State<EasySliverPage> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  double appbarHeight = 300;
  double fixedHeight = 56;
  double appbarOffset = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: IconBtnMenu.scaffoldKey,
      endDrawer: CommonDrawer(
        profileImage: Image.network(User.test().profileSrc, fit: BoxFit.fill),
        username: User.test().username,
        token: User.test().token,
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          EasySliverAppBar(
            profileImage: Image.network(User.test().profileSrc, fit: BoxFit.fill),
            username: User.test().username,
            token: User.test().token,
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
                color: Colors.purple,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
