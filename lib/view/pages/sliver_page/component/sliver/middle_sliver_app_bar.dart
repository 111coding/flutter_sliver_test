import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/const/value.dart';
import 'package:sliver_test/dummy_data/dummy_data.dart';
import 'package:sliver_test/view/components/main_button_box.dart';

class MiddleSliverAppBar extends StatelessWidget {
  const MiddleSliverAppBar({
    Key? key,
  }) : super(key: key);

  Widget _coinBox() {
    var coin = DummyData.tokens.first;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              coin.iconSrc,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${coin.amount} ${coin.name}",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 3),
              Text(
                "${coin.price} ${coin.unit}",
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
        ],
      ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _coinBox(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Expanded(
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(gradient: ColorPallete.mainLinearGradient),
                        )),
                        const Spacer(),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const MainButtonBox(),
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
