import 'package:flutter/material.dart';
import 'package:sliver_test/view/components/common_app_bar.dart';

import 'package:sliver_test/view/pages/routing_page/component/routing_page_body.dart';
import 'package:sliver_test/view/pages/setting_page/component/setting_page_body.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Setting",
        backShown: false,
        xShown: true,
        xFill: true,
        underLineShown: true,
      ),
      body: const SettingPageBody(),
    );
  }
}
