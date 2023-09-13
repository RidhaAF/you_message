import 'package:flutter/material.dart';
import 'package:you_message/app/modules/messages/message_detail/message_detail_controller.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';
import 'package:you_message/app/widgets/default_text_field.dart';

class MessageBar extends StatelessWidget {
  final MessageDetailController controller;
  const MessageBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              Expanded(
                child: DefaultTextField(
                  controller: controller.contentCtrl.value,
                  focusNode: controller.contentFocus.value,
                  labelText: '',
                  hintText: 'Type a message',
                ),
              ),
              IconButton(
                onPressed: () => controller.sendMessage(),
                icon: const Icon(Icons.send_rounded),
                color: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
