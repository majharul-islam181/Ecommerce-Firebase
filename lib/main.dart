import 'package:ecommerce_firebase/firebase_options.dart';
import 'package:ecommerce_firebase/screens/auth-ui/signup_screen.dart';
import 'package:ecommerce_firebase/screens/auth-ui/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      // home: const SignupScreen(),
      home: WelcomeScreen(),
        builder: EasyLoading.init(),
    );
  }
}
