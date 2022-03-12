import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sliver_test/view/components/sliver/easy_sliver_app_bar.dart';

class EasySliverPage extends StatefulWidget {
  const EasySliverPage({Key? key}) : super(key: key);

  @override
  State<EasySliverPage> createState() => _EasySliverPageState();
}

class _EasySliverPageState extends State<EasySliverPage> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  double appbarHeight = 300;
  double fixedHeight = 56;
  double appbarOffset = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          EasySliverAppBar(
            profileImage: Image.network("https://cdn.pixabay.com/photo/2019/02/06/09/36/lionel-messi-3978746__340.jpg", fit: BoxFit.fill),
            username: "Messi",
            token: "vsnkvsdnvklsnvklsjklvds",
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.green,
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.purple,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
