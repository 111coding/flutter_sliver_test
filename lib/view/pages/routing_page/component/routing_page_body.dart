import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';

class RoutingPageBody extends StatelessWidget {
  const RoutingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      itemCount: AppRouter.values.length,
      itemBuilder: (context, index) {
        var route = AppRouter.values[index];
        return ElevatedButton(
          onPressed: () {
            route.push();
          },
          child: Text(route.name),
        );
      },
    );
  }
}
