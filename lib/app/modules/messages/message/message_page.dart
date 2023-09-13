import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/messages/message/message_controller.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MessageController messageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Message',
          textScaleFactor: 1.0,
        ),
        actions: [
          Obx(
            () => messageController.isLoading.value
                ? const DefaultLoadingIndicator()
                : IconButton(
                    onPressed: () => messageController.signOut(),
                    tooltip: 'Sign Out',
                    icon: const Icon(Icons.logout),
                  ),
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Get.toNamed(AppRoutes.messageDetail),
          child: const Text('Detail'),
        ),
      ),
    );
  }
}
