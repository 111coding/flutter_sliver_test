import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/btn/grey_button.dart';
import 'package:sliver_test/view/components/btn/icon_btn_back.dart';
import 'package:sliver_test/view/components/btn/icon_btn_edit.dart';
import 'package:sliver_test/view/components/drawer/common_drawer_header.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';

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
          GreyButton(text: "Setting", iconPath: "assets/image/icon-back.png", onTap: () {}, margin: const EdgeInsets.symmetric(horizontal: 24)),
        ],
      ),
    );
  }
}
