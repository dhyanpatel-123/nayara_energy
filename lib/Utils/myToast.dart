
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';


class MyToast{
 static showCustom(String msg){
    Fluttertoast.showToast(
      msg:msg,
    backgroundColor: AppColors.black,
      textColor: AppColors.whiteBg,
      fontSize: 15,
      toastLength: Toast.LENGTH_LONG,


    );

  }
}