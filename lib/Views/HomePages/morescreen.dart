import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mymoretextfiled.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';

class Morescreen extends StatelessWidget {
  Morescreen({super.key});
  TextEditingController NameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: MyCustomAppbar(title: " More", centerTitle: true),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: mySize.width,
        height: mySize.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: CustomAvatar(radius: 60, assetPath: "assets/user.jpg")),
              SizedBox(height: 20),
              myCustommMoreTextfield(
                hinttext: "Profile",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Customer Management",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Suppler Management",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Budgeting Module",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),

              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Cash Deposits",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Variations",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Reports",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "Settings",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 10),
              myCustommMoreTextfield(
                hinttext: "LogOut",
                textEditingController: NameEditingController,
                iconn: FontAwesomeIcons.circleUser,
                readOnly: true,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
