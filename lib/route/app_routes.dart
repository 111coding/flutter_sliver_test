import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/sliver_page/easy_sliver_page.dart';
import 'package:sliver_test/sliver_page/hard_sliver_page.dart';
import 'package:sliver_test/sliver_page/scroll_ctrl_sliver_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final appRoutes = {
  AppRouter.scrollCtrlSliverPage.name: (context) => const ScrollCtrlSliverPage(),
  AppRouter.easySliverPage.name: (context) => const EasySliverPage(),
  AppRouter.hardSliverPage.name: (context) => const HardSliverPage(),
};
