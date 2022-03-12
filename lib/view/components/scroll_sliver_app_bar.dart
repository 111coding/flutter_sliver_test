import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliver_test/const/color_pallete.dart';
import 'package:sliver_test/view/components/image/profile_image.dart';
import 'package:sliver_test/view/components/protfolio_text.dart';
import 'package:sliver_test/view/components/token_clipboard_box.dart';

class ScrollSliverAppBar extends StatefulWidget {
  const ScrollSliverAppBar({
    Key? key,
    required this.scrollController,
    required this.profileImage,
    required this.username,
    required this.token,
    this.expandedHeight = 270,
    this.toolbarHeight = 56,
  }) : super(key: key);

  /// 상위 스크롤뷰와 연결되어있는 스크롤 컨트롤러
  final ScrollController scrollController;

  /// 최대 크기
  final double expandedHeight;

  /// 툴바 크기(최소크기)
  final double toolbarHeight;

  final Image profileImage;
  final String username;
  final String token;

  @override
  State<ScrollSliverAppBar> createState() => _ScrollSliverAppBarState();
}

class _ScrollSliverAppBarState extends State<ScrollSliverAppBar> {
  double _appbarOffset = 1;

  @override
  void initState() {
    super.initState();

    var scrollController = widget.scrollController;

    scrollController.addListener(() {
      setState(() {
        final newOffset = scrollController.offset / (widget.expandedHeight - widget.toolbarHeight);
        _appbarOffset = 1 - min(1, newOffset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      titleSpacing: 20,
      leading: const SizedBox(), // null일경우 BackButton
      actions: [
        // actions 영역을 fixedAppBar로 사용
        Container(
          // 가로방향 시 노치랑 바텀 영역 빼야됨
          width: MediaQuery.of(context).size.width - MediaQuery.of(context).padding.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // 접혔을때 영역
              Opacity(
                opacity: 1 - _appbarOffset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImage(image: widget.profileImage, diameter: 40),
                    const SizedBox(width: 6),
                    Expanded(
                      child: PortfolioText(name: widget.username, fontSize: 18),
                    ),
                    const SizedBox(width: 6),
                    TokenClipboardBox(token: widget.token),
                    const SizedBox(width: 4),
                    const Icon(Icons.qr_code_scanner),
                    const SizedBox(width: 4),
                    const Icon(Icons.menu),
                  ],
                ),
              ),
              // 펴졌을때 영역
              Opacity(
                opacity: _appbarOffset,
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
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: ColorPallete.mainLinearGradient,
        ),
        child: Opacity(
          opacity: _appbarOffset,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ProfileImage(image: widget.profileImage, diameter: 80 * _appbarOffset),
              SizedBox(height: 8 * _appbarOffset),
              PortfolioText(name: widget.username, fontSize: 24 * _appbarOffset),
              SizedBox(height: 8 * _appbarOffset),
              TokenClipboardBox(token: widget.token),
              const SizedBox(height: 20),
              Container(color: Colors.grey[50], width: double.infinity, height: 1),
            ],
          ),
        ),
      ),
      toolbarHeight: widget.toolbarHeight,
      expandedHeight: widget.expandedHeight,
    );
  }
}
