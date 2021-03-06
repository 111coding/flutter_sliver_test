import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/ntf.dart';
import 'package:sliver_test/dummy_data/value.dart';
import 'package:sliver_test/view/components/image/ntf_image.dart';

class NtfGrid extends StatelessWidget {
  const NtfGrid({
    Key? key,
    required this.ntfs,
    this.maxLength = 5,
  }) : super(key: key);

  final List<Ntf> ntfs;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int renderCount = (constraints.maxWidth / 120).floor();
          int renderCountMin = max(3, renderCount);
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: min(maxLength, ntfs.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: renderCountMin,
              childAspectRatio: 0.8 * 3 / renderCountMin,
              mainAxisExtent: 180, // 세로 최대크기
              mainAxisSpacing: 10, // 세로 간격
              crossAxisSpacing: 10, // 가로 간격
            ),
            itemBuilder: (BuildContext context, int index) {
              var n = ntfs[index];
              return Column(
                children: [
                  SizedBox(
                    width: 100,
                    child: NtfImage.asset(n.imgSrc),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${n.charName} ${n.tokenId}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    n.onwerName,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
