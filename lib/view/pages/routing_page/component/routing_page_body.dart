import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';

class RoutingPageBody extends StatelessWidget {
  const RoutingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
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
