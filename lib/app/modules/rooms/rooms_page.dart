import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart';
import 'package:you_message/app/modules/rooms/rooms_controller.dart';
import 'package:you_message/app/modules/rooms/widgets/new_users.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (RoomsController controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'YouMessage',
            textScaleFactor: 1.0,
          ),
          actions: [
            controller.isSigningOut.value
                ? const DefaultLoadingIndicator()
                : IconButton(
                    onPressed: () => controller.signOut(),
                    tooltip: 'Sign Out',
                    icon: const Icon(Icons.logout),
                  ),
          ],
        ),
        body: body(controller),
      ),
    );
  }

  Widget body(RoomsController controller) {
    if (controller.isRoomsLoading.value) {
      return const DefaultLoadingIndicator();
    } else if (controller.isRoomsLoaded.value) {
      final newUsers = controller.newUsers;
      final rooms = controller.rooms;

      if (controller.isProfilesLoaded.value) {
        final profiles = controller.profiles;

        return Column(
          children: [
            NewUsers(newUsers: newUsers),
            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, i) {
                  final room = rooms[i];
                  final otherUser = profiles[room.otherUserId];

                  return ListTile(
                    onTap: () => Get.toNamed(
                      AppRoutes.message,
                      arguments: {
                        'roomId': room.id,
                        'username': otherUser?.username,
                      },
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        otherUser?.username.substring(0, 2) ?? '',
                        textScaleFactor: 1.0,
                      ),
                    ),
                    title: Text(
                      otherUser?.username ?? '',
                      textScaleFactor: 1.0,
                    ),
                    subtitle: room.lastMessage != null
                        ? Text(
                            room.lastMessage!.content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor: 1.0,
                          )
                        : const Text(
                            'Room created',
                            textScaleFactor: 1.0,
                          ),
                    trailing: Text(
                      format(
                        room.lastMessage?.createdAt ?? room.createdAt,
                        locale: 'en_short',
                      ),
                      textScaleFactor: 1.0,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      } else {
        return const DefaultLoadingIndicator();
      }
    } else if (controller.isRoomsEmpty.value) {
      final newUsers = controller.newUsers;
      return Column(
        children: [
          NewUsers(newUsers: newUsers),
          const Expanded(
            child: Center(
              child: Text(
                'Start a chat by tapping on available users',
                textScaleFactor: 1.0,
              ),
            ),
          ),
        ],
      );
    }
    return const Center(
      child: Text(
        'Something went wrong',
        textScaleFactor: 1.0,
      ),
    );
  }
}
