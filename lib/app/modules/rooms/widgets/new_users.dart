import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/data/models/profile.dart';
import 'package:you_message/app/modules/rooms/rooms_controller.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';
import 'package:you_message/app/widgets/default_spacer.dart';

class NewUsers extends StatelessWidget {
  final List<Profile> newUsers;
  const NewUsers({super.key, required this.newUsers});

  @override
  Widget build(BuildContext context) {
    final RoomsController roomsController = Get.find();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: defaultMargin / 2),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: newUsers
            .map<Widget>((user) => InkWell(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  onTap: () async {
                    try {
                      final roomId = await roomsController.createRoom(
                          otherUserId: user.id);
                      Get.toNamed(
                        AppRoutes.message,
                        arguments: {
                          'roomId': roomId,
                          'username': user.username,
                        },
                      );
                    } catch (error) {
                      Get.snackbar('Error', error.toString());
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(defaultMargin / 2),
                    child: SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Text(user.username.substring(0, 2)),
                          ),
                          DefaultSpacer(height: defaultMargin / 2),
                          Text(
                            user.username,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
