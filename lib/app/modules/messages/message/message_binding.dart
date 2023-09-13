import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/modules/messages/message/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileService(),
    );
    Get.lazyPut(
      () => MessageController(Get.find()),
    );
  }
}
