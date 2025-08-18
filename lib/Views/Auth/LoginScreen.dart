import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/authController.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myDecorations.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/Auth/SignupScreen.dart';
import '../../Utils/myColors.dart';
import 'package:get/get.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  AuthController au = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: mySize.height / 14, left: 20, right: 20),
        width: mySize.width,
        height: mySize.height,
        child: SingleChildScrollView(
          child: AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myDecorations.logoimageScreen(context),
                SizedBox(height: 40),
                const DataText(text: 'Log In', fontSize: 29, color: AppColors.navyblue, fontWeight: FontWeight.w800),
                const DataText(text: 'Please Fill that detail for login', fontSize: 15),
                const SizedBox(height: 20),
                myCustomTextfield(

                  autofillHints: [AutofillHints.telephoneNumber],
                  validator: (val) {

                  },
                  textEditingController: au.MobileNumberController,
                  hinttext: 'Mobile Number',
                ),
                const SizedBox(height: 20),
                myCustomTextfield(
                  autofillHints: [AutofillHints.password],
                  validator: (val) {},
                  textEditingController: au.PasswordController,
                  hinttext: 'Password',
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [const DataText(text: 'Forgot Password?', fontSize: 15)],
                ),
                const SizedBox(height: 10),

              myButton(onTap: () async{

              await au.login();

              }, title: "Log In"),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataText(text: "Don't have account?", fontSize: 15),
                    GestureDetector(onTap:(){
                      Get.to(()=>Signupscreen());
                    },child: DataText(text: "Sign up", fontSize: 15, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
