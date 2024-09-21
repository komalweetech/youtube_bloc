import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:youyube_bloc/config/routes/routes_name.dart';

class SplashServices {

  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 07),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginScreen, (route) => false));
  }
}
