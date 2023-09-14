import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/rooms/rooms_controller.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class UserAvatar extends StatelessWidget {
  final String userId;
  const UserAvatar({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (RoomsController controller) {
      if (controller.isProfilesLoaded.value) {
        final user = controller.profiles[userId];
        return CircleAvatar(
          child: user == null
              ? const DefaultLoadingIndicator()
              : Text(
                  user.username.substring(0, 2),
                  textScaleFactor: 1.0,
                ),
        );
      } else {
        return const CircleAvatar(child: DefaultLoadingIndicator());
      }
    });
  }
}
