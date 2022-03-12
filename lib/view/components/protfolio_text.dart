import 'package:flutter/material.dart';

class PortfolioText extends StatelessWidget {
  const PortfolioText({
    Key? key,
    required this.name,
    required this.fontSize,
    this.height,
  }) : super(key: key);

  final String name;
  final double fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) => Text(
        "$name's Portfolio",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: Colors.white, overflow: TextOverflow.ellipsis),
      );
}
