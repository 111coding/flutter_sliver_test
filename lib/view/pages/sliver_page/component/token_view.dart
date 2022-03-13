import 'package:flutter/material.dart';
import 'package:sliver_test/const/value.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';

class TokenView extends StatelessWidget {
  const TokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
