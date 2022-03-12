import 'package:flutter/material.dart';

class NtfImage extends StatelessWidget {
  const NtfImage({
    Key? key,
    required this.image,
    this.diameter = double.infinity,
    this.borderRadius = 8,
  }) : super(key: key);

  NtfImage.network(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
    this.borderRadius = 8,
  })  : image = Image.network(src, fit: boxFit),
        super(key: key);

  NtfImage.asset(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
    this.borderRadius = 8,
  })  : image = Image.asset(src, fit: boxFit),
        super(key: key);

  /// 이미지
  final Image image;

  /// 이미지의 지름
  final double diameter;

  /// 디폴트 8
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: diameter,
        height: diameter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: image,
        ),
      ),
    );
  }
}
