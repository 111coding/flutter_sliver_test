import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';
import 'package:sliver_test/view/components/protfolio_text.dart';
import 'package:sliver_test/view/components/token_clipboard_box.dart';

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
    return SliverPersistentHeader(
      pinned: true,
      delegate: _EasySliverAppBarDelegate(profileImage: profileImage, username: username, token: token, topPaddingHeight: topPaddingHeight),
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

  final Image profileImage;
  final String username;
  final String token;

  final bgColor = Colors.white;

  _EasySliverAppBarDelegate({
    required this.profileImage,
    required this.username,
    required this.token,
    required this.topPaddingHeight,
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
      padding: EdgeInsets.only(top: topPaddingHeight, left: 24, right: 24),
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
                      const SizedBox(width: 4),
                      const Icon(Icons.qr_code_scanner),
                      const SizedBox(width: 4),
                      const Icon(Icons.menu),
                    ],
                  ),
                ),
                // 펴졌을때 영역
                Opacity(
                  opacity: offset,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/image/logo.png",
                        width: 180,
                      ),
                      Icon(Icons.menu),
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
                    Container(color: Colors.grey[50], width: double.infinity, height: 1),
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
  bool shouldRebuild(_EasySliverAppBarDelegate oldDelegate) {
    return profileImage != oldDelegate.profileImage || username != oldDelegate.username || token != oldDelegate.token;
  }
}
