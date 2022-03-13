import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/const/value.dart';

class MainButtonBox extends StatelessWidget {
  const MainButtonBox({Key? key}) : super(key: key);

  Widget _btn({required String text, required Widget icon, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: ConstValue.maxWidthSmall),
      height: 100,
      decoration: BoxDecoration(
        color: ColorPallete.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _btn(
              text: "Deposit",
              icon: const Icon(
                Icons.open_in_browser_sharp,
                size: 50,
                color: Colors.blue,
              ),
              onTap: () {}),
          _btn(
              text: "Send",
              icon: const Icon(
                Icons.send,
                size: 50,
                color: Colors.blue,
              ),
              onTap: () {}),
          _btn(
              text: "Swap",
              icon: const Icon(
                Icons.swap_horiz,
                size: 50,
                color: Colors.blue,
              ),
              onTap: () {}),
        ],
      ),
    );
  }
}
