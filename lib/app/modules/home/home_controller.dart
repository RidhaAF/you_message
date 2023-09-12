import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final ProfileService _profileService;

  HomeController(this._profileService);

  final isLoading = false.obs;

  Future<void> signOut() async {
    isLoading.value = true;

    try {
      final response = await _profileService.signOut();

      if (response['status'] == 200) {
        Get.offAllNamed(AppRoutes.signUp);
        Get.snackbar('Success', response['message']);
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
