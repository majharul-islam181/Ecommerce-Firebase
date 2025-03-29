import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        title: const Text(
          "Welcome to Ecombd",
          style: TextStyle(color: AppColors.appTextColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_image.png',
              height: 150,
              width: 150,
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text("Happy Shopping",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: Get.height / 12,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: Get.height / 12,
                width: Get.width / 1.2,
                decoration: BoxDecoration(
                  color: AppColors.appMainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google_logo.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: AppColors.appTextColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: Get.height / 12,
                width: Get.width / 1.2,
                decoration: BoxDecoration(
                  color: AppColors.appMainColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/email_logo.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Sign in with Email",
                        style: TextStyle(
                          color: AppColors.appTextColor,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
