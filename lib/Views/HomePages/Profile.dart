import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("Profile")),
          ElevatedButton(onPressed: () async {
            await mySharedPref().clearData();


          }, child: Text("removeToken"))
          
        ],
      ),
    );
  }

}
