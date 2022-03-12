import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.image,
    this.diameter = double.infinity,
  }) : super(key: key);

  ProfileImage.network(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
  })  : image = Image.network(src, fit: boxFit),
        super(key: key);

  ProfileImage.asset(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
  })  : image = Image.asset(src, fit: boxFit),
        super(key: key);

  /// 이미지
  final Image image;

  /// 이미지의 지름
  final double diameter;

  @override
  Widget build(BuildContext context) {
    // CircleAvartar는 AnimatedContainer라서 추후 애니메이션효과 커스텀하기 부적합
    return SizedBox(
      width: diameter,
      child: AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          width: diameter,
          height: diameter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(diameter == double.infinity ? 10000 : diameter),
            child: image,
          ),
        ),
      ),
    );
  }
}
