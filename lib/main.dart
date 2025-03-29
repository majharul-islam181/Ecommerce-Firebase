import 'package:ecommerce_firebase/screens/auth-ui/signin_screen.dart';
import 'package:ecommerce_firebase/screens/auth-ui/signup_screen.dart';
import 'package:ecommerce_firebase/screens/auth-ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecombd',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const UserScreen(),
      // home: const SplashScreen(),
      // home: const SigninScreen(),
      home: const SignupScreen(),
    );
  }
}
