import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/modules/messages/message_detail/message_detail_controller.dart';
import 'package:you_message/app/modules/messages/message_detail/widgets/message_bar.dart';
import 'package:you_message/app/modules/messages/message_detail/widgets/message_bubble.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Message Detail',
          textScaleFactor: 1.0,
        ),
      ),
      body: GetBuilder<MessageDetailController>(
        builder: (controller) {
          return StreamBuilder<List<Message>>(
            stream: controller.messagesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final messages = snapshot.data != null ? snapshot.data! : [];

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
                              reverse: true,
                              itemCount: messages.length,
                              itemBuilder: (context, i) {
                                final message = messages[i];

                                controller.loadProfileCache(
                                    profileId: message.profileId);

                                return MessageBubble(
                                  message: message,
                                  profile: controller
                                      .profileCache[message.profileId],
                                );
                              },
                            ),
                    ),
                    MessageBar(controller: controller),
                  ],
                );
              } else {
                return const Center(
                  child: DefaultLoadingIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
