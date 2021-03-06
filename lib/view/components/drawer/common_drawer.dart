import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_router.dart';
import 'package:sliver_test/view/components/btn/grey_button.dart';
import 'package:sliver_test/view/components/drawer/common_drawer_header.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key? key,
    required this.profileImage,
    required this.username,
    required this.token,
  }) : super(key: key);

  final Image profileImage;
  final String username;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          CommonDrawerHeader(profileImage: profileImage, token: token, username: username),
          GreyButton(text: "Imaport Account", iconPath: "assets/image/icon-back.png", onTap: () {}, margin: const EdgeInsets.symmetric(horizontal: 24)),
          const SizedBox(height: 6),
          GreyButton(text: "Sync with mobile", iconPath: "assets/image/icon-back.png", onTap: () {}, margin: const EdgeInsets.symmetric(horizontal: 24)),
          const SizedBox(height: 6),
          GreyButton(
            text: "Setting",
            iconPath: "assets/image/icon-back.png",
            onTap: () {
              AppRouter.settingPage.push();
            },
            margin: const EdgeInsets.symmetric(horizontal: 24),
          ),
        ],
      ),
    );
  }
}
