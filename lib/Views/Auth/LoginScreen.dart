import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myDecorations.logoimageScreen(context),
                  SizedBox(height: 40),
                  const DataText(text: 'Log In', fontSize: 29, color: AppColors.navyblue, fontWeight: FontWeight.w800),
                  const DataText(text: 'Please Fill that detail for login', fontSize: 15),
                  const SizedBox(height: 20),
                  myCustomTextfield(

                    iconn: FontAwesomeIcons.circleUser,

                    autofillHints: [AutofillHints.telephoneNumber],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      if (!GetUtils.isPhoneNumber(val)) {
                        return 'Enter Valid Number';
                      }
                      if (val.length != 10) {   // optional: only 10-digit numbers
                        return 'Mobile number must be 10 digits';
                      }

                      return null;
                    },
                    textEditingController: au.MobilenumberController,
                    hinttext: 'MobileNumber',
                  ),
                  const SizedBox(height: 20),
                  myCustomTextfield(
                    iconn: Icons.lock_outline_rounded,
                    autofillHints: [AutofillHints.password],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }

                      if (val.length < 6 || val.length>13) {   // optional: only 10-digit numbers
                        return  'Password must be 6 to 13 characters';
                      }

                      return null;
                    },
                    textEditingController: au.PasswordController,
                    hinttext: 'Password',
                    isObscure: true,

                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [const DataText(text: 'Forgot Password?', fontSize: 15)],
                  ),
                  const SizedBox(height: 10),

                  myButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await au.login();
                      }
                    },
                    title: "Log In",
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DataText(text: "Don't have account?", fontSize: 15),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Signupscreen());
                        },
                        child: DataText(text: "Sign up", fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
