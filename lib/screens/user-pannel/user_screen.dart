import 'package:ecommerce_firebase/screens/auth-ui/welcome_screen.dart';
import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:ecommerce_firebase/utils/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.appMainName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appMainColor,
        actions: [
          InkWell(
              onTap: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                FirebaseAuth _auth = FirebaseAuth.instance;
                await _auth.signOut();
                await googleSignIn.signOut();

                Get.offAll(() => WelcomeScreen());
              },
              child: const Icon(
                Icons.logout,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
