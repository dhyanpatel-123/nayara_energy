import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/HomePages/morescreen.dart';

class Profile extends StatelessWidget {
  Profile({super.key,required this.wantBackButton});
  TextEditingController NameEditingController = TextEditingController();
  final bool wantBackButton;

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: MyCustomAppbar(title: "Profile", centerTitle: true),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: mySize.width,
        height: mySize.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CustomAvatar(radius: 50, assetPath: "assets/user.jpg")),
              SizedBox(height: 20),
              myCustomTextfield(hinttext: "Name", textEditingController: NameEditingController,),
              SizedBox(height: 10),
              myCustomTextfield(hinttext: "Email", textEditingController: NameEditingController),
              SizedBox(height: 10),
              myCustomTextfield(hinttext: "Mobile No", textEditingController: NameEditingController),
              SizedBox(height: 10),
              myCustomTextfield(hinttext: "Address", textEditingController: NameEditingController),
              
              ElevatedButton(onPressed: () {
                Get.to(()=>Morescreen());

              }, child: Text("more")),
              ElevatedButton(onPressed: () async {
                await mySharedPref().clearData();




              }, child: Text("removeToken"))

            ],
          ),
        ),
      ),
    );
  }
}
