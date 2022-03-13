import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/collectable.dart';
import 'package:sliver_test/view/components/image/collectable_image.dart';

class CollectableGrid extends StatelessWidget {
  const CollectableGrid({Key? key, required this.collectables}) : super(key: key);

  final List<Collectable> collectables;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: min(5, collectables.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        mainAxisExtent: 125, // 세로 최대크기
        mainAxisSpacing: 10, // 세로 간격
        crossAxisSpacing: 10, // 가로 간격
      ),
      itemBuilder: (BuildContext context, int index) {
        var c = collectables[index];
        return Column(
          children: [
            SizedBox(
              width: 80,
              child: CollectableImage.asset(c.ntfs.first.imgSrc),
            ),
            const SizedBox(height: 6),
            Text(c.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 3),
            Text("${c.ntfs.length}Ntfs"),
          ],
        );
      },
    );
  }
}
