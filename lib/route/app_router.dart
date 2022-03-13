import 'package:flutter/material.dart';
import 'package:sliver_test/route/app_routes.dart';

enum AppRouter {
  scrollCtrlSliverPage,
  easySliverPage,
  hardSliverPage,
  settingPage,
  artDetailPage,
}

class AppNavigator {
  /// 뒤로가기
  static void pop<T extends Object?>([T? result]) => Navigator.of(navigatorKey.currentState!.context).pop();
}

/// 따로 파일로 빼버리면 AppRouter 확장함수 이용 시 AppRouterExtension이 포함된 파일을 따로 import 시켜줘야함
/// 함께있으면 AppRouter 만 import 하면 사용가능 (개발시 용이)
extension AppRouterExtension on AppRouter {
  /// 라우팅(현재페이지 위에 push)
  Future<T?> push<T extends Object?>({Object? arguments}) => navigatorKey.currentState!.pushNamed(name, arguments: arguments);

  /// 라우팅(현재페이지 pop 후 push)
  Future<T?> popPush<T extends Object?, TO extends Object?>(Object? result, Object? arguments) => navigatorKey.currentState!.popAndPushNamed(name, result: result, arguments: arguments);

  /// 라우팅(이전페이지 모두 pop 후 push)
  Future<T?> popAllPush<T extends Object?>({Object? arguments}) => navigatorKey.currentState!.pushNamedAndRemoveUntil(name, (route) => false, arguments: arguments);

  /// 뒤로가기
  static void pop<T extends Object?>([T? result]) => Navigator.of(navigatorKey.currentState!.context).pop();
}
