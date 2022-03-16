import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/collectable.dart';
import 'package:sliver_test/view/components/image/collectable_image.dart';
import 'package:sliver_test/view/components/line.dart';

class ArtBottomArea extends StatelessWidget {
  const ArtBottomArea({
    Key? key,
    required this.height,
    required this.currentIndex,
    required this.datas,
    required this.onPageChanged,
    required this.onItemTap,
  }) : super(key: key);

  final double height;
  final int currentIndex;
  final List<Collectable> datas;
  final Function(int newIndex) onPageChanged;
  final Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    int temp = (MediaQuery.of(context).size.width / 80).floor();
    int count = max(5, temp);

    return Container(
      height: height,
      color: Colors.white,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        itemCount: (datas.length / count).ceil(),
        itemBuilder: (context, pageIndex) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: min(count, datas.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              childAspectRatio: 0.8,
              mainAxisExtent: height, // 세로 최대크기
            ),
            itemBuilder: (BuildContext context, int index) {
              int absIndex = index + pageIndex * count;
              var c = datas[absIndex];
              return Column(
                children: [
                  Line(color: absIndex == currentIndex ? Colors.black : Colors.grey),
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          onItemTap(absIndex);
                        },
                        child: SizedBox(
                          width: 40,
                          child: CollectableImage.asset(c.ntfs.first.imgSrc),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
