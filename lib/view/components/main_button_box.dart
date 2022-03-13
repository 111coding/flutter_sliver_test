import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/const/value.dart';

class MainButtonBox extends StatelessWidget {
  const MainButtonBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: ConstValue.maxWidthSmall),
      height: 100,
      decoration: BoxDecoration(
        color: ColorPallete.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
