import 'package:flutter/material.dart';

class CollectableImage extends StatelessWidget {
  const CollectableImage({
    Key? key,
    required this.image,
    this.diameter = double.infinity,
    this.borderColor = Colors.grey,
    this.padding = 3,
  }) : super(key: key);

  CollectableImage.network(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
    this.borderColor = Colors.grey,
    this.padding = 3,
  })  : image = Image.network(src, fit: boxFit),
        super(key: key);

  CollectableImage.asset(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
    this.borderColor = Colors.grey,
    this.padding = 3,
  })  : image = Image.asset(src, fit: boxFit),
        super(key: key);

  /// 이미지
  final Image image;

  /// 이미지의 지름
  final double diameter;

  /// 테두리 색상
  /// 디폴트 그레이
  final Color borderColor;

  /// 테두리와 이미지 사이의 간격입니다
  /// 디폴트 3
  final double padding;

  @override
  Widget build(BuildContext context) {
    final calulatedBorderRadius = BorderRadius.circular(diameter == double.infinity ? 1000 : diameter);
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: calulatedBorderRadius,
          // shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(padding),
        child: ClipRRect(
          borderRadius: calulatedBorderRadius,
          child: image,
        ),
      ),
    );
  }
}
