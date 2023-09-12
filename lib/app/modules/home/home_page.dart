import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/home/home_controller.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          textScaleFactor: 1.0,
        ),
        actions: [
          Obx(
            () => homeController.isLoading.value
                ? const DefaultLoadingIndicator()
                : IconButton(
                    onPressed: () => homeController.signOut(),
                    icon: const Icon(Icons.logout),
                  ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24),
          textScaleFactor: 1.0,
        ),
      ),
    );
  }
}
