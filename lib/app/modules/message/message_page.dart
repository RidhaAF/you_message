import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/message/message_controller.dart';
import 'package:you_message/app/modules/message/widgets/message_bar.dart';
import 'package:you_message/app/modules/message/widgets/message_bubble.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? username = Get.arguments['username'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          username ?? 'Message',
          textScaleFactor: 1.0,
        ),
      ),
      body: GetBuilder<MessageController>(
        builder: (controller) {
          if (controller.isMessageLoading.value) {
            return const DefaultLoadingIndicator();
          } else if (controller.isMessageLoaded.value) {
            final messages = controller.messages;

            return Column(
              children: [
                Expanded(
                  child: messages.isEmpty
                      ? const Center(
                          child: Text(
                            'Start your conversation now :)',
                            textScaleFactor: 1.0,
                          ),
                        )
                      : ListView.builder(
                          padding:
                              EdgeInsets.symmetric(vertical: defaultMargin / 2),
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, i) {
                            final message = messages[i];

                            return MessageBubble(message: message);
                          },
                        ),
                ),
                MessageBar(controller: controller),
              ],
            );
          } else if (controller.isMessageEmpty.value) {
            return Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Start your conversation now :)',
                      textScaleFactor: 1.0,
                    ),
                  ),
                ),
                MessageBar(controller: controller),
              ],
            );
          } else {
            return const DefaultLoadingIndicator();
          }
        },
      ),
    );
  }
}
