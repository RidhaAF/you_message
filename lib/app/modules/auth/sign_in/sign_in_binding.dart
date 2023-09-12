import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/modules/auth/sign_in/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileService());
    Get.lazyPut(
      () => SignInController(Get.find()),
    );
  }
}
