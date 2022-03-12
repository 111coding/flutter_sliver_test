import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/btn/asset_button.dart';

class IconBtnMenu extends AssetButton {
  const IconBtnMenu({Key? key}) : super(key: key);

  @override
  String get path => "assets/image/icon-menu.png";

  @override
  void onTap() {
    // TODO 햄버거
    print("햄버거");
  }
}
