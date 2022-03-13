import 'package:flutter/material.dart';
import 'package:sliver_test/const/value.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
        child: const Center(
          child: Text("Game Area"),
        ),
      ),
    );
  }
}
