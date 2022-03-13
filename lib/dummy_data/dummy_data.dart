import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/token.dart';
import 'package:sliver_test/route/app_routes.dart';

class DummyData {
  static final tokens = [
    Token(name: "Klay", amount: 45, price: 3247.93, unit: "USD", imgSrc: "assets/image/klay.png"),
    Token(name: "Bora", amount: 45, price: 3247.93, unit: "USD", imgSrc: "assets/image/bora.png"),
    Token(name: "Wemix", amount: 160, price: 47.93, unit: "USD", imgSrc: "assets/image/wemix.png"),
    Token(name: "Kronos", amount: 360, price: 247.93, unit: "USD", imgSrc: "assets/image/kronos.png"),
    Token(name: "Draco", amount: 60, price: 3247.93, unit: "USD", imgSrc: "assets/image/draco.png"),
    Token(name: "Hydra", amount: 160, price: 47.93, unit: "USD", imgSrc: "assets/image/hydra.png"),
  ];
}
