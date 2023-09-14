import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/data/services/rooms_service.dart';
import 'package:you_message/app/modules/rooms/rooms_controller.dart';

class RoomsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RoomService(),
    );
    Get.lazyPut(
      () => ProfileService(),
    );
    Get.lazyPut(
      () => RoomsController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
