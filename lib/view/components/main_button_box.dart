import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';

class MainButtonBox extends StatelessWidget {
  const MainButtonBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: ColorPallete.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
