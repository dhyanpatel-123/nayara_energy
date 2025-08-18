import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/authController.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myDecorations.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Views/BottomNavigation_Screens/Mainscreens.dart';

class Signupscreen extends StatelessWidget {
   Signupscreen({super.key});
  AuthController au = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {




    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: mySize.height / 200, left: 20, right: 20),
          width: mySize.width,
          height: mySize.height,
          child: SingleChildScrollView(
            child: AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  myDecorations.logoimageScreen(context),
                  // SizedBox(height: 40,),
                  const DataText(text: 'Sign up', fontSize: 29, color: AppColors.navyblue, fontWeight: FontWeight.w800),
                  const DataText(text: 'Please Fill that detail for login', fontSize: 15),

                  const SizedBox(height: 20),

                  myCustomTextfield(
                    autofillHints: [AutofillHints.name],
                    validator: (val) {},
                    textEditingController: au.SignupFirstName,
                    hinttext: 'FirstName',
                  ),
                  const SizedBox(height: 20),
                  myCustomTextfield(
                    autofillHints: [AutofillHints.middleName],
                    validator: (val) {

                    },
                    textEditingController: au.SignupLastName,
                    hinttext: 'LastName',
                  ),
                  const SizedBox(height: 20),
                  myCustomTextfield(
                    autofillHints: [AutofillHints.email],
                    validator: (val) {},
                    textEditingController: au.SignupEmail,
                    hinttext: 'Email',
                  ),
                  const SizedBox(height: 10),

                  myCustomTextfield(
                    autofillHints: [AutofillHints.telephoneNumber],
                    validator: (val) {},
                    textEditingController: au.SignupMobileNumber,
                    hinttext: 'Mobile Number',
                  ),
                  const SizedBox(height: 10),
                  myCustomTextfield(
                    autofillHints: [AutofillHints.addressCity],
                    validator: (val) {},
                    textEditingController: au.SignupMobileAddress,
                    hinttext: 'Address',
                  ),
                  const SizedBox(height: 10),

                  myCustomTextfield(
                    autofillHints: [AutofillHints.password],
                    validator: (val) {},
                    textEditingController: au.PasswordController,
                    hinttext: 'Password',
                  ),
                  const SizedBox(height: 10),
                  myCustomTextfield(
                    autofillHints: [AutofillHints.password],
                    validator: (val) {},
                    textEditingController: au.SignupConfirmPassword,
                    hinttext: 'Confirm Password',
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [const DataText(text: 'Forgot Password?', fontSize: 15)],
                  ),
                  const SizedBox(height: 10),

                  myButton(onTap: () async {

                   bool isvalue=  await au.SignUp();
                   if(isvalue==true){
                   Get.back();
                   }

                  }, title: "Sign up"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DataText(text: "Don't have account?", fontSize: 15),
                      InkWell(
                        onTap: () {

                        },
                        child: DataText(text: "Log In", fontSize: 15, color: Colors.grey),
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
