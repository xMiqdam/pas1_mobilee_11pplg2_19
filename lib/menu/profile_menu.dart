import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/button.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/color.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/text.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/textText.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              SizedBox(height: 10),
              MyTextt(
                text: "Lionel Messi",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ), 
                
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ListTile(
                    title: MyTextt(
                      text: "Phone",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    subtitle: MyTextt(
                      text: "083815504228",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    leading: Icon(Icons.phone, color: Colors.white),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    tileColor: blackColor,
                  ),
                  Divider(thickness: 0.5, color: Colors.white),
                  ListTile(
                    title: MyTextt(
                      text: "E-mail",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    subtitle: MyTextt(
                      text: "JohnDoe@gmail.com",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    leading: Icon(Icons.mail, color: Colors.white),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    tileColor: blackColor,
                  ),
                  Divider(thickness: 0.5, color: Colors.white),
                  ListTile(
                    title: MyTextt(
                      text: "Payment",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    subtitle: MyTextt(
                      text: "DANA",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    leading: Icon(Icons.wallet, color: Colors.white),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    tileColor: blackColor,
                  ),
                  Divider(thickness: 0.5, color: Colors.white),
                  ListTile(
                    title: MyTextt(
                      text: "Setting",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    subtitle: MyTextt(
                      text: "setting",
                      style: TextStyle(color: whiteColor, fontSize: 15),
                    ),
                    leading: Icon(Icons.settings, color: Colors.white),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    tileColor: blackColor,
                  ),
                  Divider(thickness: 0.5, color: Colors.white),
                ],
              ),
              SizedBox(height: 20),
              MyButton(
                backgroundColor: redColor,
                text: "Log Out",
                style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
                onPressed: () {
                  Get.offNamed('/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
