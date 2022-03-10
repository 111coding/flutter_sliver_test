import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransitionSliver extends StatelessWidget {
  final Widget avatar;
  final String username;
  final String token;
  final double extent;

  TransitionSliver({required this.avatar, required this.username, required this.token, this.extent = 250, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionSliverDelegate(avatar: avatar, username: username, token: token, extent: extent > 200 ? extent : 200),
    );
  }
}

class _TransitionSliverDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
    begin: EdgeInsets.only(bottom: 90),
    end: EdgeInsets.only(left: 24, top: 44), // left margin
  );

  final _usernameMarginTween = EdgeInsetsTween(
    begin: EdgeInsets.only(bottom: 60),
    end: EdgeInsets.only(left: 24 + 32 + 10, top: 52), // left margin + avatar width + margin
  );

  final _tokenMarginTween = EdgeInsetsTween(
    begin: EdgeInsets.only(bottom: 20),
    end: EdgeInsets.only(right: 24 + 32 + 4 + 20, top: 43.0), // right margin + menu width + margin
  );

  final _avatarAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topLeft);
  final _tokenAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topRight);

  final Widget avatar;
  final String username;
  final String token;
  final double extent;

  final bgColor = Colors.white;

  _TransitionSliverDelegate({required this.avatar, required this.username, required this.token, this.extent = 250}) : assert(extent >= 200);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = 72 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;

    // y = -(x^2)

    print(tempVal);
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final usernameMargin = _usernameMarginTween.lerp(progress);
    final tokenMargin = _tokenMarginTween.lerp(progress);

    final avatarAlign = _avatarAlignTween.lerp(progress);
    final tokenAlign = _tokenAlignTween.lerp(progress);

    final avatarSize = (1 - progress) * 100 + 32; // 최대사이즈 132 최소사이즈 32

    return Container(
      color: bgColor,
      child: Stack(
        children: <Widget>[
          Container(
            height: minExtent,
            constraints: BoxConstraints(maxHeight: minExtent),
            color: bgColor,
          ),
          Positioned(
            top: 47,
            left: 24,
            child: Opacity(
              opacity: 1 - progress,
              child: Text("LOGO"),
            ),
          ),
          Padding(
            padding: avatarMargin,
            child: Align(
              alignment: avatarAlign,
              child: SizedBox(
                height: avatarSize,
                width: avatarSize,
                child: avatar,
              ),
            ),
          ),
          Padding(
            padding: usernameMargin,
            child: Align(
              alignment: avatarAlign,
              child: Text(
                username,
              ),
            ),
          ),
          // TOKEN
          Padding(
            padding: tokenMargin,
            child: Align(
              alignment: tokenAlign,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 50,
                      child: Text(token, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 4),
                    Container(width: 24, height: 24, color: Colors.red),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 24,
            top: MediaQuery.of(context).padding.top,
            child: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(_TransitionSliverDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || username != oldDelegate.username || token != oldDelegate.token;
  }
}
