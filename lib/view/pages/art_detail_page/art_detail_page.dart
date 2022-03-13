import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/collectable.dart';
import 'package:sliver_test/domain/model/user.dart';
import 'package:sliver_test/dummy_data/dummy_data.dart';
import 'package:sliver_test/view/components/btn/mini_button.dart';
import 'package:sliver_test/view/components/common_app_bar.dart';
import 'package:sliver_test/view/pages/art_detail_page/component/art_detail_body.dart';

class ArtDetailPage extends StatefulWidget {
  const ArtDetailPage({Key? key}) : super(key: key);

  @override
  State<ArtDetailPage> createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
  int currentCollectableIndex = 0;
  List<Collectable> datas = DummyData.collectables;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        titleWidget: Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "${User.test().username} Portfolio /"),
                  TextSpan(text: datas[currentCollectableIndex].name, style: const TextStyle(fontWeight: FontWeight.bold)),
                ], style: const TextStyle(fontSize: 18)),
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 10),
            MiniButton(
              icon: const Icon(Icons.format_list_bulleted, size: 18),
              onTap: () {},
              isFill: true,
            ),
            const SizedBox(width: 10),
            MiniButton(
              icon: const Icon(Icons.linear_scale_rounded, size: 18),
              onTap: () {},
              isFill: true,
            ),
          ],
        ),
        backShown: true,
      ),
      body: ArtDetailBody(
        onCollectableChanged: (int index) {
          setState(() {
            currentCollectableIndex = index;
          });
        },
      ),
    );
  }
}
