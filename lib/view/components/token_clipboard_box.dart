import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_test/const/color_pallete.dart';

class TokenClipboardBox extends StatelessWidget {
  const TokenClipboardBox({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Clipboard.setData(ClipboardData(text: token)),
      child: Container(
        width: 120,
        height: 30,
        decoration: BoxDecoration(
          color: ColorPallete.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  token.length <= 8 ? token : "${token.substring(0, 4)}...${token.substring(token.length - 4, token.length)}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.copy, size: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
