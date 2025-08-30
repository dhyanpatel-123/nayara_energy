import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mybellicon extends StatelessWidget {
  const Mybellicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(onPressed: () {


      }, icon:Icon(FontAwesomeIcons.solidBell,size: 20,),
    ));
  }
}
