import 'package:flutter/material.dart';
import 'package:sliver_test/const/value.dart';
import 'package:sliver_test/dummy_data/dummy_data.dart';
import 'package:sliver_test/view/components/btn/more_button.dart';
import 'package:sliver_test/view/pages/sliver_page/component/art/collectable_grid.dart';
import 'package:sliver_test/view/pages/sliver_page/component/art/label_text.dart';
import 'package:sliver_test/view/pages/sliver_page/component/art/ntf_grid.dart';
import 'package:sliver_test/view/components/line.dart';

class ArtView extends StatelessWidget {
  const ArtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              LabelText(label: "Collectables", onTap: () {}),
              CollectableGrid(collectables: DummyData.collectables),
              const SizedBox(height: 20),
              MoreButton(text: "${DummyData.collectables.length - 5} more Collectables", onTap: () {}),
              const SizedBox(height: 30),
              Line(color: Colors.grey[400]!),
              const SizedBox(height: 10),
              LabelText(label: "Single Ntfs", onTap: () {}),
              NtfGrid(ntfs: DummyData.singleNtfs),
              const SizedBox(height: 20),
              MoreButton(text: "${DummyData.singleNtfs.length - 5} more Ntfs", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
