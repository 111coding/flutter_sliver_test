import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_routes.dart';

class Token {
  String name;
  double amount;
  double price;
  String unit;
  String imgSrc;
  String iconSrc; // 흰색

  Token({
    required this.name,
    required this.amount,
    required this.price,
    required this.unit,
    required this.imgSrc,
    required this.iconSrc,
  });
}
