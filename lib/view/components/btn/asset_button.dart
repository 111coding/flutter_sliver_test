import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';

abstract class AssetButton extends StatelessWidget {
  const AssetButton({Key? key}) : super(key: key);

  String get path;
  void onTap();
  Color get color => Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(path, color: color),
        ),
      ),
    );
  }
}
