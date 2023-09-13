import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/routes/app_routes.dart';

class SignInController extends GetxController {
  final ProfileService _profileService;

  SignInController(this._profileService);

  final formKey = GlobalKey<FormState>();
  final Rx<TextEditingController> emailCtrl = TextEditingController().obs;
  final Rx<TextEditingController> passwordCtrl = TextEditingController().obs;
  final Rx<FocusNode> emailFocus = FocusNode().obs;
  final Rx<FocusNode> passwordFocus = FocusNode().obs;
  final isLoading = false.obs;

  Future<void> signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isLoading.value = true;

    try {
      final response = await _profileService.signIn(
        email: emailCtrl.value.text,
        password: passwordCtrl.value.text,
      );

      if (response['status'] == 200) {
        Get.offAllNamed(AppRoutes.rooms);
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
