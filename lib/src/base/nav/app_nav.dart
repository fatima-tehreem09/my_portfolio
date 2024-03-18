library app_navigation;

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/src/base/nav/routes.dart';

import 'app_pages.dart';

abstract class AppNavigation {
  static final GoRouter _router = AppRouter.router;

  bool isLogin = false;

  static void to(
    AppPages appPages, {
    Object? extra,
    Map<String, String>? query,
    Map<String, String>? path,
  }) {
    if (kIsWeb) {
      goNamed(
        appPages,
        extra: extra,
        query: query,
        path: path,
      );
    } else {
      _pushNamed(
        appPages,
        extra: extra,
        query: query,
        path: path,
      );
    }
  }

  static void goNamed(
    AppPages appPages, {
    Object? extra,
    Map<String, String>? query,
    Map<String, String>? path,
  }) {
    _router.goNamed(
      appPages.name,
      extra: extra,
      pathParameters: path ?? <String, String>{},
      queryParameters: query ?? <String, String>{},
    );
  }

  static void _pushNamed(
    AppPages appPages, {
    Object? extra,
    Map<String, String>? query,
    Map<String, String>? path,
  }) {
    _router.pushNamed(
      appPages.name,
      extra: extra,
      pathParameters: path ?? <String, String>{},
      queryParameters: query ?? <String, String>{},
    );
  }

  // static void goPush(AppPages appPages) {
  //   _router.go(appPages.path);
  // }

  static bool get canPop => _router.canPop();

  static void pop() {
    if (!canPop) return;
    _router.pop();
  }

  static void replace(
    AppPages appPages, {
    Object? extra,
    Map<String, String>? query,
    Map<String, String>? path,
  }) {
    _router.pushReplacementNamed(
      appPages.name,
      extra: extra,
      pathParameters: path ?? <String, String>{},
      queryParameters: query ?? <String, String>{},
    );
  }
}
