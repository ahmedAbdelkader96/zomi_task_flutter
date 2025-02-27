import 'package:flutter/cupertino.dart';
import 'package:task/features/authentication/screens/auth_screen.dart';
import 'package:task/features/authentication/screens/refresh_token_screen.dart';
import 'package:task/features/main_view/screens/main_view_screen.dart';

class Routes {
  static Future<dynamic> authScreen({required BuildContext context}) async {
    return Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => AuthScreen()),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> mainViewScreen({required BuildContext context}) async {
    return Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => MainViewScreen()),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> refreshTokenScreen(
      {required BuildContext context, required String refreshToken}) async {
    return Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                RefreshTokenScreen(refreshToken: refreshToken)));
  }
}
