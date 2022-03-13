import 'package:flutter/material.dart';
import 'package:sliver_test/view/components/btn/asset_button.dart';

class IconBtnMenu extends AssetButton {
  const IconBtnMenu({Key? key}) : super(key: key);

  static final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  String get path => "assets/image/icon-menu.png";

  @override
  void onTap() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
