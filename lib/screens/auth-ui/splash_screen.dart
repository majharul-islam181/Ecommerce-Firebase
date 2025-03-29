import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:ecommerce_firebase/utils/strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/splash_image.png',
              height: 150,
              width: 150,
            ),
          ),
          Center(
              child: Text(
            AppString.appPoweredBy,
            style: const TextStyle(color: Colors.white),
          )),
        ],
      ),
    );
  }
}
