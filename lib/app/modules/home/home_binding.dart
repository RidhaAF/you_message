import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileService(),
    );
    Get.lazyPut(
      () => HomeController(Get.find()),
    );
  }
}
