import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/btn/icon_btn_menu.dart';
import 'package:sliver_test/view/components/btn/icon_btn_scan.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';
import 'package:sliver_test/view/components/protfolio_text.dart';
import 'package:sliver_test/view/components/token_clipboard_box.dart';
import 'package:sliver_test/view/components/line.dart';

class EasySliverAppBar extends StatelessWidget {
  const EasySliverAppBar({
    Key? key,
    required this.profileImage,
    required this.username,
    required this.token,
    this.expandedHeight = 270,
    this.toolbarHeight = 56,
  }) : super(key: key);

  /// 최대 크기
  final double expandedHeight;

  /// 툴바 크기(최소크기)
  final double toolbarHeight;

  final Image profileImage;
  final String username;
  final String token;

  @override
  Widget build(BuildContext context) {
    final topPaddingHeight = MediaQuery.of(context).padding.top;
    final paddingLeft = MediaQuery.of(context).padding.left + 24;
    final paddingRight = MediaQuery.of(context).padding.right + 24;
    return SliverPersistentHeader(
      pinned: true,
      delegate: _EasySliverAppBarDelegate(
        profileImage: profileImage,
        username: username,
        token: token,
        expandedHeight: expandedHeight,
        toolbarHeight: toolbarHeight,
        topPaddingHeight: topPaddingHeight,
        paddingLeft: paddingLeft,
        paddingRight: paddingRight,
      ),
    );
  }
}

class _EasySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  /// 최대 크기
  final double expandedHeight;

  /// 툴바 크기(최소크기)
  final double toolbarHeight;

  /// StatusBar
  final double topPaddingHeight;

  final double paddingLeft;
  final double paddingRight;

  final Image profileImage;
  final String username;
  final String token;

  _EasySliverAppBarDelegate({
    required this.profileImage,
    required this.username,
    required this.token,
    required this.topPaddingHeight,
    required this.paddingLeft,
    required this.paddingRight,
    this.expandedHeight = 270,
    this.toolbarHeight = 56,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bodyHeight = expandedHeight - toolbarHeight;
    final double offset = 1 - min(1, shrinkOffset / bodyHeight);
    return Container(
      decoration: const BoxDecoration(
        gradient: ColorPallete.mainLinearGradient,
      ),
      padding: EdgeInsets.only(top: topPaddingHeight, left: paddingLeft, right: paddingRight),
      child: Column(
        children: [
          // 상단바
          SizedBox(
            width: double.infinity,
            height: toolbarHeight,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // 접혔을때 영역
                Opacity(
                  opacity: 1 - offset,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileImage(image: profileImage, diameter: 40),
                      const SizedBox(width: 6),
                      Expanded(
                        child: PortfolioText(name: username, fontSize: 18),
                      ),
                      const SizedBox(width: 6),
                      TokenClipboardBox(token: token),
                      const SizedBox(width: 16),
                      const IconBtnMenu(),
                    ],
                  ),
                ),
                // 펴졌을때 영역
                Opacity(
                  opacity: offset,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image/logo.png",
                        width: 180,
                      ),
                      const Spacer(),
                      const IconBtnScan(),
                      const SizedBox(width: 16),
                      const IconBtnMenu(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 큰 프로필 영역
          SizedBox(
            height: bodyHeight * offset,
            child: Opacity(
              opacity: offset,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                reverse: true,
                child: Column(
                  children: [
                    ProfileImage(image: profileImage, diameter: 80 * offset),
                    SizedBox(height: 8 * offset),
                    PortfolioText(name: username, fontSize: 24 * offset),
                    SizedBox(height: 8 * offset),
                    TokenClipboardBox(token: token),
                    const SizedBox(height: 20),
                    const Line(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + topPaddingHeight;

  @override
  double get minExtent => toolbarHeight + topPaddingHeight;

  @override
  bool shouldRebuild(_EasySliverAppBarDelegate oldDelegate) => true;
}
