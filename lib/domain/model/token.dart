import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_routes.dart';

class Token {
  String name;
  int amount;
  double price;
  String unit;
  String imgSrc;

  Token({
    required this.name,
    required this.amount,
    required this.price,
    required this.unit,
    required this.imgSrc,
  });
}
