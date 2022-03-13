import 'package:flutter/material.dart';
import 'package:sliver_test/const/value.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
    this.height = 1,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      width: double.infinity,
      height: 1,
      constraints: const BoxConstraints(maxWidth: ConstValue.maxWidth),
    );
  }
}
