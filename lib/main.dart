import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_routes.dart';
import 'package:sliver_test/routing_page/routing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      navigatorKey: navigatorKey,
      home: const RoutingPage(),
    );
  }
}
