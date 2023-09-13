import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/rooms/rooms_controller.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomsController roomsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YouMessage',
          textScaleFactor: 1.0,
        ),
        actions: [
          Obx(
            () => roomsController.isLoading.value
                ? const DefaultLoadingIndicator()
                : IconButton(
                    onPressed: () => roomsController.signOut(),
                    tooltip: 'Sign Out',
                    icon: const Icon(Icons.logout),
                  ),
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Get.toNamed(AppRoutes.message),
          child: const Text(
            'Go To Message',
            textScaleFactor: 1.0,
          ),
        ),
      ),
    );
  }
}
