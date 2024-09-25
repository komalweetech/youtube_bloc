import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      padding:const EdgeInsets.all(15),
      message: message,
      duration:const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: Colors.red,
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: const Icon(Icons.error),
    )..show(context));
  }
}
