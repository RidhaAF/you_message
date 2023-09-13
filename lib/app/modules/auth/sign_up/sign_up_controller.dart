import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/routes/app_routes.dart';

class SignUpController extends GetxController {
  final ProfileService _profileService;

  SignUpController(this._profileService);

  final formKey = GlobalKey<FormState>();
  final Rx<TextEditingController> emailCtrl = TextEditingController().obs;
  final Rx<TextEditingController> passwordCtrl = TextEditingController().obs;
  final Rx<TextEditingController> usernameCtrl = TextEditingController().obs;
  final Rx<FocusNode> emailFocus = FocusNode().obs;
  final Rx<FocusNode> passwordFocus = FocusNode().obs;
  final Rx<FocusNode> usernameFocus = FocusNode().obs;
  final isLoading = false.obs;

  Future<void> signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;

    try {
      final response = await _profileService.signUp(
        email: emailCtrl.value.text,
        password: passwordCtrl.value.text,
        username: usernameCtrl.value.text,
      );

      if (response['status'] == 201) {
        Get.offAllNamed(AppRoutes.home);
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
