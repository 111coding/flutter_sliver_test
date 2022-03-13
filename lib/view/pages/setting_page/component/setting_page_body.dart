import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sliver_test/view/components/btn/grey_button.dart';

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      children: [
        GreyButton(iconPath: "assets/image/icon-back.png", text: "Currency", onTap: () {}),
        const SizedBox(height: 10),
        GreyButton(iconPath: "assets/image/icon-back.png", text: "Language", onTap: () {}),
        const SizedBox(height: 10),
        GreyButton(iconPath: "assets/image/icon-back.png", text: "Auto Lock", onTap: () {}),
        const SizedBox(height: 10),
        GreyButton(iconPath: "assets/image/icon-back.png", text: "Sync with obile", onTap: () {}),
        const SizedBox(height: 10),
        GreyButton(iconPath: "assets/image/icon-back.png", text: "View Secret recovery phrase", onTap: () {}),
        const SizedBox(height: 20),
        Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold),
            children: [
              const TextSpan(text: "If you ever have questions or see something fishy, submit your request "),
              TextSpan(
                  text: "here",
                  style: const TextStyle(color: Colors.orange),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("HERE");
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
