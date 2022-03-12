import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/btn/asset_button.dart';

class IconBtnBack extends AssetButton {
  const IconBtnBack({Key? key}) : super(key: key);

  @override
  String get path => "assets/image/icon-back.png";

  @override
  void onTap() {
    AppNavigator.pop();
  }
}
