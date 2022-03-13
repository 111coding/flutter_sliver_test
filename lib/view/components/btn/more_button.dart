import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
