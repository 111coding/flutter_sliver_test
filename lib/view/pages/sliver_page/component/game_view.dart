import 'package:flutter/material.dart';
import 'package:sliver_test/const/value.dart';

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
