import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/models/profile.dart';
import 'package:you_message/app/data/services/message_service.dart';

class MessageController extends GetxController {
  final MessageService _messageService;

  MessageController(this._messageService);

  late Stream<List<Message>> messagesStream = const Stream.empty();
  final Map<String, Profile> profileCache = {};
  final Rx<TextEditingController> contentCtrl = TextEditingController().obs;
  final Rx<FocusNode> contentFocus = FocusNode().obs;

  Future<void> messageByUserId() async {
    try {
      final response = await _messageService.messageByUserId();

      if (response['status'] == 200) {
        messagesStream = response['data'];
        update();
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> loadProfileCache({required String profileId}) async {
    if (profileCache[profileId] != null) {
      return;
    }

    try {
      final response =
          await _messageService.loadProfileCache(profileId: profileId);

      if (response['status'] == 200) {
        profileCache[profileId] = response['data'];
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> sendMessage() async {
    if (contentCtrl.value.text.isEmpty) {
      return;
    }

    try {
      final response = await _messageService.sendMessage(
        content: contentCtrl.value.text,
      );

      if (response['status'] == 200) {
        contentCtrl.value.clear();
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    messageByUserId();
  }
}
