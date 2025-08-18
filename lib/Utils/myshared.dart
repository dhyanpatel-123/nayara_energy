import 'package:shared_preferences/shared_preferences.dart';

class mySharedPref {
  setData(token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', token);
  }

  //////////////////////////////////////
  getData(data) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    switch (data) {
      case 'token':
        return sp.getString('token');
      default:
    }
  }
  ///////////////////////////////////////

  clearData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
  }
}
