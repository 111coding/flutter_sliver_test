import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/pages/setting_page/setting_page.dart';
import 'package:sliver_test/view/pages/sliver_page/easy_sliver_page.dart';
import 'package:sliver_test/view/pages/sliver_page/hard_sliver_page.dart';
import 'package:sliver_test/view/pages/sliver_page/scroll_ctrl_sliver_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final appRoutes = {
  AppRouter.scrollCtrlSliverPage.name: (context) => const ScrollCtrlSliverPage(),
  AppRouter.easySliverPage.name: (context) => const EasySliverPage(),
  AppRouter.hardSliverPage.name: (context) => const HardSliverPage(),
  AppRouter.settingPage.name: (context) => const SettingPage(),
};
