import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/btn/asset_button.dart';

class IconBtnScan extends AssetButton {
  const IconBtnScan({Key? key}) : super(key: key);

  @override
  String get path => "assets/image/icon-scan.png";

  @override
  void onTap() {
    // TODO 스캔기능
    print("TODO");
  }
}
