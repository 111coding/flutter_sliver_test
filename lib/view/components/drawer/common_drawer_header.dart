import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/btn/icon_btn_back.dart';
import 'package:sliver_test/view/components/btn/icon_btn_edit.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';

class CommonDrawerHeader extends StatelessWidget {
  const CommonDrawerHeader({
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
    return DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.grey[200],
              child: Row(
                children: [
                  ProfileImage(image: profileImage, diameter: 50),
                  const SizedBox(width: 6),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        token,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  )),
                  const IconBtnEdit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
