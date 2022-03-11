import 'package:flutter/material.dart';

/// Example
/// CustomImage.network(
///   "https://cdn.pixabay.com/photo/2019/02/06/09/36/lionel-messi-3978746__340.jpg",
///   diameter: 200,
///   border: Border.all(color: Colors.grey),
///   borderPadding: const EdgeInsets.all(10),
/// )
///
class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.image,
    this.diameter = double.infinity,
    this.borderRadius,
    this.border,
    this.borderPadding,
  }) : super(key: key);

  CustomImage.network(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
    this.borderRadius,
    this.border,
    this.borderPadding,
  })  : image = Image.network(src, fit: boxFit),
        super(key: key);

  CustomImage.asset(
    String src, {
    Key? key,
    BoxFit boxFit = BoxFit.fill,
    this.diameter = double.infinity,
    this.borderRadius,
    this.border,
    this.borderPadding,
  })  : image = Image.asset(src, fit: boxFit),
        super(key: key);

  /// 이미지
  final Image image;

  /// 이미지의 지름
  final double diameter;

  /// borderRadius
  /// null일 시 diameter만큼 줘서 원으로 보여줌
  /// diameter / 2 가 정확한 원의 값이나 연산을 줄이고자 diameter만큼 줍니다
  final double? borderRadius;

  /// 테두리이며 디폴트는 테두리가 없습니다
  final Border? border;

  /// 테두리와 이미지 사이의 간격입니다
  final EdgeInsets? borderPadding;

  @override
  Widget build(BuildContext context) {
    final calulatedBorder = BorderRadius.circular(borderRadius ?? diameter);
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        border: border,
        borderRadius: calulatedBorder,
      ),
      padding: borderPadding,
      child: ClipRRect(
        borderRadius: calulatedBorder,
        child: image,
      ),
    );
  }
}
