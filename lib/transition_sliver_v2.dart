import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransitionSliverV2 extends StatelessWidget {
  final Widget avatar;
  final String username;
  final String token;
  final double extent;

  const TransitionSliverV2({required this.avatar, required this.username, required this.token, this.extent = 250, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionSliverV2Delegate(avatar: avatar, username: username, token: token, extent: extent > 200 ? extent : 200),
    );
  }
}

class _TransitionSliverV2Delegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 90),
    end: const EdgeInsets.only(left: 24, top: 44), // left margin
  );

  final _usernameMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 60),
    end: const EdgeInsets.only(left: 24 + 32 + 10, top: 52), // left margin + avatar width + margin
  );

  final _tokenMarginTween = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 20),
    end: const EdgeInsets.only(right: 24 + 32 + 4 + 20, top: 43.0), // right margin + menu width + margin
  );

  final _avatarAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topLeft);
  final _tokenAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topRight);

  final Widget avatar;
  final String username;
  final String token;
  final double extent;

  final bgColor = Colors.white;

  _TransitionSliverV2Delegate({required this.avatar, required this.username, required this.token, this.extent = 250}) : assert(extent >= 200);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = minExtent * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    // final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    // print(shrinkOffset / maxExtent);
    final double avatarProgress = progress >= 1 / 3 ? 1 : progress * 3;
    final double usernameProgress = progress < 1 / 3
        ? 0
        : progress > 2 / 3
            ? 1
            : (progress - 1 / 3) * 3;
    final double tokenProgress = progress < 2 / 3 ? 0 : (progress - 2 / 3) * 3;

    // y = -(x^2)

    final avatarMargin = _avatarMarginTween.lerp(avatarProgress);
    final usernameMargin = _usernameMarginTween.lerp(usernameProgress);
    final tokenMargin = _tokenMarginTween.lerp(tokenProgress);

    final avatarAlign = _avatarAlignTween.lerp(avatarProgress);
    final usernameAlign = _avatarAlignTween.lerp(usernameProgress);
    final tokenAlign = _tokenAlignTween.lerp(tokenProgress);
    // print("$avatarAlign $avatarProgress");
    // print("$usernameAlign $usernameProgress");
    // print("$tokenMargin $tokenAlign $tokenProgress");

    final double avatarSize = (1 - avatarProgress) * 100 + 32; // 최대사이즈 132 최소사이즈 32

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
              alignment: usernameAlign,
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
  bool shouldRebuild(_TransitionSliverV2Delegate oldDelegate) {
    return avatar != oldDelegate.avatar || username != oldDelegate.username || token != oldDelegate.token;
  }
}
