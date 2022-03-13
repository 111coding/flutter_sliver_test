import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/collectable.dart';
import 'package:sliver_test/dummy_data/dummy_data.dart';
import 'package:sliver_test/view/components/image/collectable_image.dart';
import 'package:sliver_test/view/components/line.dart';
import 'package:sliver_test/view/pages/art_detail_page/component/art_bottom_area.dart';
import 'package:sliver_test/view/pages/sliver_page/component/art/ntf_grid.dart';

class ArtDetailBody extends StatefulWidget {
  const ArtDetailBody({
    Key? key,
    required this.onCollectableChanged,
  }) : super(key: key);
  final Function(int index) onCollectableChanged;

  @override
  State<ArtDetailBody> createState() => _ArtDetailBodyState();
}

class _ArtDetailBodyState extends State<ArtDetailBody> {
  @override
  void initState() {
    super.initState();
  }

  final double height = 80;
  int tableIndex = 0;

  int currentCollectableIndex = 0;
  List<Collectable> datas = DummyData.collectables;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: NtfGrid(
              ntfs: datas[currentCollectableIndex].ntfs,
              maxLength: datas[currentCollectableIndex].ntfs.length,
            ),
          ),
        ),
        ArtBottomArea(
            height: height,
            currentIndex: currentCollectableIndex,
            datas: datas,
            onPageChanged: (int newIndex) {
              setState(() {
                currentCollectableIndex = newIndex * 5;
              });
              widget.onCollectableChanged(newIndex);
            },
            onItemTap: (int absIndex) {
              setState(() {
                currentCollectableIndex = absIndex;
              });
              widget.onCollectableChanged(absIndex);
            }),
        Container(height: MediaQuery.of(context).padding.bottom)
      ],
    );
  }
}
