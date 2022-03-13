import 'package:flutter/material.dart';
import 'package:sliver_test/domain/model/ntf.dart';
import 'package:sliver_test/route/app_routes.dart';

class Collectable {
  String name;
  List<Ntf> ntfs;

  Collectable({
    required this.name,
    required this.ntfs,
  });
}
