import 'package:get/get.dart';
import 'package:you_message/app/data/services/message_service.dart';
import 'package:you_message/app/modules/messages/message_detail/message_detail_controller.dart';

class MessageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MessageService(),
    );
    Get.lazyPut(
      () => MessageDetailController(Get.find()),
    );
  }
}
