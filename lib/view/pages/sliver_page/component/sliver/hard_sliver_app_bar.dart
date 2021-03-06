import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/btn/icon_btn_menu.dart';
import 'package:sliver_test/view/components/btn/icon_btn_scan.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';
import 'package:sliver_test/view/components/line.dart';
import 'package:sliver_test/view/components/protfolio_text.dart';
import 'package:sliver_test/view/components/token_clipboard_box.dart';

class HardSliverAppBar extends StatelessWidget {
  const HardSliverAppBar({
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
      delegate: _HardSliverAppBarDelegate(
        profileImage: profileImage,
        username: username,
        token: token,
        expandedHeight: expandedHeight,
        toolbarHeight: toolbarHeight,
        paddingLeft: paddingLeft,
        paddingRight: paddingRight,
        topPaddingHeight: topPaddingHeight,
      ),
    );
  }
}

class _HardSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _HardSliverAppBarDelegate({
    required this.profileImage,
    required this.username,
    required this.token,
    required this.topPaddingHeight,
    required this.paddingLeft,
    required this.paddingRight,
    this.expandedHeight = 270,
    this.toolbarHeight = 56,
  });

  /// 최대 크기
  final double expandedHeight;

  /// 툴바 크기(최소크기)
  final double toolbarHeight;

  /// StatusBar
  final double topPaddingHeight;

  final Image profileImage;
  final String username;
  final String token;

  final double paddingLeft;
  final double paddingRight;

  // 프로필이미지 시작위치와 끝위치
  late final _profileImageMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 100),
    end: EdgeInsets.only(left: paddingLeft, top: topPaddingHeight), // left margin
  );

  // 유저네임 시작위치와 끝위치
  late final _usernameMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 60),
    end: EdgeInsets.only(left: paddingLeft + 40 + 6, top: topPaddingHeight), // left margin + avatar width + margin
  );

  // 토큰위젯 시작위치와 끝위치
  late final _tokenMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 20),
    end: EdgeInsets.only(right: paddingRight + 30, top: topPaddingHeight), // right margin + menu width + margin
  );

  final _profileImageAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.centerLeft);
  final _tokenAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.centerRight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = min(1, shrinkOffset / (expandedHeight - toolbarHeight));

    // y = -(x^2)

    final profileMargin = _profileImageMarginTween.lerp(offset);
    final usernameMargin = _usernameMarginTween.lerp(offset);
    final tokenMargin = _tokenMarginTween.lerp(offset);

    final profileAlign = _profileImageAlignTween.lerp(offset);
    final tokenAlign = _tokenAlignTween.lerp(offset);

    final profileSize = 40 + 40 * (1 - offset); // 40~80

    return Container(
      decoration: const BoxDecoration(gradient: ColorPallete.mainLinearGradient),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          // 로고
          Positioned(
            top: topPaddingHeight,
            left: paddingLeft,
            height: toolbarHeight,
            child: Opacity(
              opacity: 1 - offset,
              child: Image.asset(
                "assets/image/logo.png",
                width: 180,
              ),
            ),
          ),
          // 스캐너 아이콘
          Positioned(
            top: topPaddingHeight,
            right: paddingRight + 40, // MenuIcon Width + margin
            height: toolbarHeight,
            child: Opacity(
              opacity: 1 - offset,
              child: const IconBtnScan(),
            ),
          ),
          // 햄버거 메뉴
          Positioned(
            top: topPaddingHeight,
            right: paddingRight,
            height: toolbarHeight,
            child: const IconBtnMenu(),
          ),
          // 프로파일 이미지
          Padding(
            padding: profileMargin,
            child: Align(
              alignment: profileAlign,
              child: ProfileImage(image: profileImage, diameter: profileSize),
            ),
          ),

          // USERNAME
          Padding(
            padding: usernameMargin,
            child: Align(
              alignment: profileAlign,
              child: PortfolioText(name: username, fontSize: 18 + 6 * (1 - offset)),
            ),
          ),

          // TOKEN
          Padding(
            padding: tokenMargin,
            child: Align(
              alignment: tokenAlign,
              child: TokenClipboardBox(token: token),
            ),
          ),

          // LINE

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: paddingLeft, right: paddingRight),
              child: Line(height: offset == 1 ? 0 : 1),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + topPaddingHeight;

  @override
  double get minExtent => toolbarHeight + topPaddingHeight;

  @override
  bool shouldRebuild(_HardSliverAppBarDelegate oldDelegate) => true;
}
