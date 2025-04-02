import 'package:ecommerce_firebase/controller/sign_in_controller.dart';
import 'package:ecommerce_firebase/screens/auth-ui/forget-password-screen.dart';
import 'package:ecommerce_firebase/screens/auth-ui/signup_screen.dart';
import 'package:ecommerce_firebase/screens/user-pannel/user_screen.dart';
import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SignInController signInController = Get.put(SignInController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
                controller: userEmail,
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
                child: Obx(
                  () => TextFormField(
                    controller: userPassword,
                    obscureText: signInController.isPasswordVisible.value,
                    cursorColor: AppColors.appSecondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        hintText: "Password",
                        suffixIcon: InkWell(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        prefixIcon: const Icon(Icons.password)),
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              Get.to(() => const ForgetPasswordScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              child: const Text(
                'Forget Password?',
                style: TextStyle(color: AppColors.appMainColor),
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          InkWell(
            onTap: () async {
              String email = userEmail.text.trim();
              String password = userPassword.text.trim();
              if (email.isEmpty || password.isEmpty) {
                Get.snackbar(
                  "Error",
                  "Please Enter all details",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: AppColors.appSecondaryColor,
                  colorText: AppColors.appTextColor,
                );
              } else {
                UserCredential? userCredential =
                    await signInController.signInMethod(email, password);
                if (userCredential != null) {
                  if (userCredential.user!.emailVerified) {
                    Get.snackbar(
                      "Success",
                      "Login successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.appSecondaryColor,
                      colorText: AppColors.appTextColor,
                    );

                    Get.offAll(() => const UserScreen());
                  } else {
                    Get.snackbar(
                      "Error",
                      "Please Verify your emaiil before login",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.appSecondaryColor,
                      colorText: AppColors.appTextColor,
                    );
                  }
                } else {
                  Get.snackbar(
                    "Error",
                    "Please try again",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.appSecondaryColor,
                    colorText: AppColors.appTextColor,
                  );
                }
              }
            },
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
              Get.to(() => const SignupScreen());
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
