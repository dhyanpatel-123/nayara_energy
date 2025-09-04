import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/DailyEntryController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/RefillController.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  void changeTab(int index) {
    currentIndex = index;
    update(); // refresh UI
  }




}
class BottomNavBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>BottomNavController(),fenix: true);
    Get.lazyPut(()=>HomeController(),fenix: true);
    Get.lazyPut(()=>DailyEntryContoller(),fenix: true);
    Get.lazyPut(()=>RefillController(),fenix: true);
  }
}
