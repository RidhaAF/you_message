import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:timeago/timeago.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/models/profile.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';
import 'package:you_message/app/widgets/default_loading_indicator.dart';
import 'package:you_message/app/widgets/default_spacer.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final Profile? profile;
  const MessageBubble({
    super.key,
    required this.message,
    this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: defaultMargin / 2, vertical: defaultMargin),
      child: Row(
        mainAxisAlignment:
            message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: messageContents(),
      ),
    );
  }

  List<Widget> messageContents() {
    List<Widget> bubble = [
      if (!message.isMine)
        CircleAvatar(
          child: profile == null
              ? const DefaultLoadingIndicator()
              : Text(
                  profile!.username.substring(0, 2),
                  textScaleFactor: 1.0,
                ),
        ),
      DefaultSpacer(width: defaultMargin),
      Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: defaultMargin / 2,
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: message.isMine
                ? primaryColor
                : (Get.isDarkMode ? greyColor : secondaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message.content,
            style: message.isMine ? TextStyle(color: whiteColor) : null,
            textScaleFactor: 1.0,
          ),
        ),
      ),
      DefaultSpacer(width: defaultMargin / 2),
      Text(
        format(message.createdAt, locale: 'en_short'),
        style: TextStyle(
          color: mutedColor,
          fontSize: 12,
        ),
        textScaleFactor: 1.0,
      ),
    ];
    if (message.isMine) {
      bubble = bubble.reversed.toList();
    }

    return bubble;
  }
}
