import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/ntf.dart';
import 'package:sliver_test/view/components/image/ntf_image.dart';

class NtfGrid extends StatelessWidget {
  const NtfGrid({Key? key, required this.ntfs}) : super(key: key);

  final List<Ntf> ntfs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: min(5, ntfs.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
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
  }
}
