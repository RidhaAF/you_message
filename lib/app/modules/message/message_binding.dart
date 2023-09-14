import 'package:get/get.dart';
import 'package:you_message/app/data/services/message_service.dart';
import 'package:you_message/app/modules/message/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MessageService(),
    );
    Get.lazyPut(
      () => MessageController(Get.find()),
    );
  }
}
