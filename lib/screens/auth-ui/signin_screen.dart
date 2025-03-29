import 'package:ecommerce_firebase/screens/auth-ui/signup_screen.dart';
import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
        backgroundColor: AppColors.appMainColor,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: AppColors.appSecondaryColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: AppColors.appSecondaryColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    hintText: "Password",
                    suffixIcon: const Icon(Icons.visibility),
                    prefixIcon: const Icon(Icons.password)),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: const Text(
              'Forget Password?',
              style: TextStyle(color: AppColors.appMainColor),
            ),
          ),
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
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in ",
                      style: TextStyle(
                        color: AppColors.appTextColor,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 30,
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => const SignupScreen());
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account? Sign up ",
                  style: TextStyle(
                    color: AppColors.appMainColor,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
