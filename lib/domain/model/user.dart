import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_routes.dart';

class User {
  String username;
  String token;
  String profileSrc;

  User({
    required this.username,
    required this.token,
    required this.profileSrc,
  });

  User.test()
      : this(
          username: "Messi",
          token: "vsnkvsdnvklsnvklsjklvds",
          profileSrc: "https://cdn.pixabay.com/photo/2019/02/06/09/36/lionel-messi-3978746__340.jpg",
        );
}
