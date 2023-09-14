import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/models/profile.dart';
import 'package:you_message/app/data/services/message_service.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class MessageController extends GetxController {
  final MessageService _messageService;

  MessageController(this._messageService);

  // late Stream<List<Message>> messagesStream = const Stream.empty();
  final isMessageLoading = false.obs;
  final isMessageLoaded = false.obs;
  final isMessageEmpty = false.obs;
  StreamSubscription<List<Message>>? messagesSubscription;
  List<Message> messages = [];
  late final String _roomId;
  late final String _myUserId;
  final Map<String, Profile> profileCache = {};
  final Rx<TextEditingController> contentCtrl = TextEditingController().obs;
  final Rx<FocusNode> contentFocus = FocusNode().obs;

  Future<void> setMessagesListener({required String roomId}) async {
    _roomId = roomId;
    _myUserId = supabase.auth.currentUser!.id;

    try {
      final response =
          await _messageService.setMessagesListener(roomId: roomId);

      if (response['status'] == 200) {
        messagesSubscription = response['data'].listen((msgs) {
          messages = msgs;
          if (messages.isEmpty) {
            isMessageEmpty.value = true;
          } else {
            isMessageLoaded.value = true;
          }
          update();
        });
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

    final msg = Message(
      id: 'new',
      roomId: _roomId,
      profileId: _myUserId,
      content: contentCtrl.value.text,
      createdAt: DateTime.now(),
      isMine: true,
    );
    messages.insert(0, msg);
    isMessageLoaded.value = true;
    update();

    try {
      final response = await _messageService.sendMessage(message: msg);

      if (response['status'] == 200) {
        contentCtrl.value.clear();
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
      messages.removeWhere((message) => message.id == 'new');
      isMessageLoaded.value = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    final roomId = Get.arguments['roomId'] ?? '';
    setMessagesListener(roomId: roomId);
  }

  @override
  void onClose() {
    super.onClose();
    messagesSubscription?.cancel();
  }
}
