import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  const GreyButton({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.onTap,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final void Function() onTap;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blueGrey[100]!;
                }
                return Colors.blueGrey[50]!;
              },
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(iconPath, color: Colors.blueGrey[800]),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
