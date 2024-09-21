import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:youyube_bloc/config/routes/routes_name.dart';
import 'package:youyube_bloc/data/exceptions/app_exceptions.dart';
import 'package:youyube_bloc/services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade200,
      body:  Center(
            child: Lottie.asset('assets/lottie/shopping.json')
        ),
      );
  }
}
