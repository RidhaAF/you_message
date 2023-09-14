import 'package:you_message/app/data/models/message.dart';

abstract class MessageRepository {
  Future<Map<String, dynamic>> setMessagesListener({required String roomId});

  Future<Map<String, dynamic>> sendMessage({required Message message});
}
