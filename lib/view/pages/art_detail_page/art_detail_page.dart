import 'package:flutter/material.dart';
import 'package:sliver_test/view/components/common_app_bar.dart';
import 'package:sliver_test/view/pages/art_detail_page/component/art_detail_body.dart';

class ArtDetailPage extends StatefulWidget {
  const ArtDetailPage({Key? key}) : super(key: key);

  @override
  State<ArtDetailPage> createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Setting",
        backShown: false,
        xShown: true,
        xFill: true,
        underLineShown: true,
      ),
      body: const ArtDetailBody(),
    );
  }
}
