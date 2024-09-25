import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:youyube_bloc/config/routes/routes_name.dart';
import 'package:youyube_bloc/services/session_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
            const Duration(seconds: 03),
                () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.homeScreen , (route) => false));
      }else {
        Timer(
            const Duration(seconds: 03),
                () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      }
    }).onError((error, stackTrace) {
      Timer(
          const Duration(seconds: 03),
          () => Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginScreen, (route) => false));
    });
  }
}
