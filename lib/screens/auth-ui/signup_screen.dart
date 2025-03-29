import 'package:ecommerce_firebase/screens/auth-ui/signin_screen.dart';
import 'package:ecommerce_firebase/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                child: TextFormField(
                  cursorColor: AppColors.appSecondaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      hintText: "Password",
                      suffixIcon: const Icon(Icons.visibility_off),
                      prefixIcon: const Icon(Icons.password)),
                ),
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
