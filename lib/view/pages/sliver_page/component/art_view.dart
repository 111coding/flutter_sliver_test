import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';

class ArtView extends StatelessWidget {
  const ArtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      itemCount: 100,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            //
          },
          child: Text("$index"),
        );
      },
    );
  }
}
