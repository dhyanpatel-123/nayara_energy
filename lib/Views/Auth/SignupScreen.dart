import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nayara_energy_app/Controller/authController.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myDecorations.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Views/Auth/LoginScreen.dart';
import 'package:nayara_energy_app/Views/BottomNavigation_Screens/Mainscreens.dart';

class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});
  AuthController au = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: mySize.width,
        height: mySize.height,
        child: SingleChildScrollView(
          child: AutofillGroup(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // SizedBox(height: 40,),
                  const DataText(text: 'Sign up', fontSize: 29, color: AppColors.navyblue, fontWeight: FontWeight.w800),
                  const DataText(text: 'Please Fill that detail for login', fontSize: 15),

                  const SizedBox(height: 20),

                  myCustomTextfield(
                    iconn: FontAwesomeIcons.circleUser,
                    autofillHints: [AutofillHints.name],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    textEditingController: au.SignupFirstName,
                    hinttext: 'FirstName',
                  ),
                  const SizedBox(height: 20),
                  myCustomTextfield(
                    iconn: FontAwesomeIcons.circleUser,
                    autofillHints: [AutofillHints.middleName],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    textEditingController: au.SignupLastName,
                    hinttext: 'LastName',
                  ),
                  const SizedBox(height: 20),
                  myCustomTextfield(
                    iconn: Icons.email,
                    autofillHints: [AutofillHints.email],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      if (!GetUtils.isEmail(val)) {
                        return 'Enter Valid Email';
                      }

                      return null;
                    },
                    textEditingController: au.SignupEmail,
                    hinttext: 'Email',
                  ),
                  const SizedBox(height: 10),

                  myCustomTextfield(
                    iconn: FontAwesomeIcons.phone,
                    autofillHints: [AutofillHints.telephoneNumber],

                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      if (!GetUtils.isPhoneNumber(val)) {
                        return 'Enter Valid Number';
                      }

                      if (val.length != 10) {
                        // optional: only 10-digit numbers
                        return 'Mobile number must be 10 digits';
                      }

                      return null;
                    },
                    textEditingController: au.SignupMobileNumber,
                    hinttext: 'Mobile Number',
                    keyboardType: TextInputType.number,

                  ),

                  const SizedBox(height: 10),

                  myCustomTextfield(
                    iconn: Icons.lock_outline_rounded,
                   isObscure:au.obscuresign1 ,

                    autofillHints: [AutofillHints.password],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }

                      if (val.length < 6 || val.length>20) {   // optional: only 10-digit numbers
                        return  'Password must be 6 to 20 characters';
                      }

                      return null;
                    },
                    textEditingController: au.SignupPassword,
                    hinttext: 'Password',
                    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  ),
                  const SizedBox(height: 10),
                  myCustomTextfield(
                    iconn: Icons.lock_outline_rounded,
                    autofillHints: [AutofillHints.password],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'This field is required';
                      }
                      if (val != au.SignupPassword.text) {
                        return 'Password Mismatched';
                      }

                      if (val.length < 6 || val.length>13) {   // optional: only 10-digit numbers
                        return  'Password must be 6 to 20 characters';
                      }

                      return null;
                    },
                    textEditingController: au.SignupConfirmPassword,
                    hinttext: 'Confirm Password',
                    // inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
                        try {
                          await au.SignUp();
                        } catch (e, s) {
                          print("api failed");
                          print(s);
                        }
                      }
                    },
                    title: "Sign up",
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DataText(text: "Don't have account?", fontSize: 15),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Get.to(() => Loginscreen());
                        },
                        child: DataText(text: "Log In", fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
