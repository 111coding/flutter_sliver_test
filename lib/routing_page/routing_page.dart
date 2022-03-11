import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sliver_test/routing_page/component/routing_page_body.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RoutingPage"),
      ),
      body: const RoutingPageBody(),
    );
  }
}
