import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/btn/icon_btn_menu.dart';
import 'package:sliver_test/view/components/btn/icon_btn_scan.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';
import 'package:sliver_test/view/components/main_button_box.dart';
import 'package:sliver_test/view/components/protfolio_text.dart';
import 'package:sliver_test/view/components/token_clipboard_box.dart';

class MiddleSliverAppBar extends StatelessWidget {
  const MiddleSliverAppBar({
    Key? key,
  }) : super(key: key);

  Widget _coinBox() {
    return Row(
      children: [
        Container(width: 50, height: 50, color: Colors.white),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "100.13 Klay",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 3),
            Text(
              "142.13 USD",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
        const Spacer(),
        Container(color: Colors.white, width: 24, height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 200.0,
      delegate: SliverChildListDelegate(
        [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(gradient: ColorPallete.mainLinearGradient),
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _coinBox(),
                      const SizedBox(height: 20),
                      const MainButtonBox(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
