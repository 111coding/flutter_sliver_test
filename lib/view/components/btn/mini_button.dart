import 'package:flutter/material.dart';

class MiniButton extends StatelessWidget {
  const MiniButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isFill = false,
  }) : super(key: key);

  final Widget icon;
  final void Function() onTap;
  final bool isFill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isFill ? Colors.grey[300]! : null,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon,
      ),
    );
  }
}
