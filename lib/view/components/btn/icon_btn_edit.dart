import 'package:flutter/material.dart';
import 'package:sliver_test/view/components/btn/asset_button.dart';

class IconBtnEdit extends AssetButton {
  const IconBtnEdit({Key? key}) : super(key: key);

  // TODO
  @override
  String get path => "assets/image/icon-back.png";

  @override
  Color get color => Colors.black;

  @override
  void onTap() {
    // TODO
  }
}
