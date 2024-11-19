
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/controller/login_controller.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/color.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/text.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/textfield.dart';


class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: 60),
             MyText(
              hintText: 'Login',
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              colors: whiteColor,
            ),
            const SizedBox(height: 8),
            MyText(
              hintText: 'Selamat Datang',
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              colors: whiteColor,
            ),
             SizedBox(height: 40),
             MyText(
              hintText: 'Username',
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              colors: blackColor,
            ),
             SizedBox(height: 8),
         MyTextField(
                hintText: 'Username',
                controller: usernameController,
                obscureText: false,
                borderRadius: 8,
                backgroundColor: Colors.white,
                labelColor: blackColor,
              ),
             SizedBox(height: 16),
             MyText(
              hintText: 'Password',
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              colors: blackColor,
            ),
            const SizedBox(height: 8),
            MyTextField(
                hintText: 'Username',
                controller: passwordController,
                obscureText: true,
                borderRadius: 8,
                backgroundColor: Colors.white,
                labelColor: blackColor,
              ),
             SizedBox(height: 20),
            Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                padding:  EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text(
                          "Username and password must be filled!"),
                      backgroundColor: Colors.redAccent,
                      duration:  Duration(seconds: 1),
                    ),
                  );
                } else {
                  await controller.login(
                    usernameController.text,
                    passwordController.text,
                  );

                  if (controller.loginStatus.value ==
                      "Login success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MyText(
                          hintText: controller.loginStatus.value,
                          fontSize: 16,
                          colors: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        backgroundColor: redColor,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                    Get.toNamed('/dashboard');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MyText(
                          hintText: controller.loginStatus.value,
                          fontSize: 16,
                          colors: whiteColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                }
              },
              child: Text(
                controller.isLoading.value ? "Loading..." : "Login",
                style:  TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )),
             SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  hintText: "Don't have an account? ",
                  fontSize: 16,
                  colors: whiteColor,
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: MyText(
                    hintText: 'Sign Up',
                    fontSize: 16,
                    colors: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}