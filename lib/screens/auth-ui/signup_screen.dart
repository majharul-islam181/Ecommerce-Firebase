import 'package:ecommerce_firebase/controller/signup_controller.dart';
import 'package:ecommerce_firebase/screens/auth-ui/signin_screen.dart';
import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Screen'),
        backgroundColor: AppColors.appMainColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                child: TextFormField(
                  controller: username,
                  cursorColor: AppColors.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      hintText: "UserName",
                      prefixIcon: const Icon(Icons.person)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: userPhone,
                  cursorColor: AppColors.appSecondaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      hintText: "Phone",
                      prefixIcon: const Icon(Icons.call)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: userCity,
                  cursorColor: AppColors.appSecondaryColor,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      hintText: "City",
                      prefixIcon: const Icon(Icons.location_city)),
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
                    obscureText: signUpController.isPasswordVisible.value,
                    cursorColor: AppColors.appSecondaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        hintText: "Password",
                        suffixIcon: InkWell(
                            onTap: () {
                              signUpController.isPasswordVisible.toggle();
                            },
                            child: signUpController.isPasswordVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        prefixIcon: const Icon(Icons.password)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            InkWell(
              onTap: () async {
                String name = username.text.trim();
                String email = userEmail.text.trim();
                String phone = userPhone.text.trim();
                String city = userCity.text.trim();
                String password = userPassword.text.trim();
                String userDeviceToken = '';
                // String? userDeviceToken =
                //     await notificationService.getDeviceToken();

                if (name.isEmpty ||
                    email.isEmpty ||
                    phone.isEmpty ||
                    city.isEmpty ||
                    password.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Please enter all details",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.appSecondaryColor,
                    colorText: AppColors.appTextColor,
                  );
                } else {
                  UserCredential? userCredential =
                      await signUpController.signUpMethod(
                    name,
                    email,
                    phone,
                    city,
                    password,
                    userDeviceToken,
                  );

                  if (userCredential != null) {
                    Get.snackbar(
                      "Verification email sent.",
                      "Please check your email.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.appSecondaryColor,
                      colorText: AppColors.appTextColor,
                    );

                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => const SigninScreen());
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
                Get.offAll(() => const SigninScreen());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alreay have an account ? Sign in ",
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
      ),
    );
  }
}
