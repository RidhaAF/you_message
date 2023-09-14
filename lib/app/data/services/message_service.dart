import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/repositories/message_repository.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class MessageService implements MessageRepository {
  final myUserId = supabase.auth.currentUser!.id;

  @override
  Future<Map<String, dynamic>> setMessagesListener(
      {required String roomId}) async {
    try {
      final messagesSubscription = supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .eq('room_id', roomId)
          .order('created_at')
          .map<List<Message>>(
            (maps) => maps
                .map<Message>(
                  (json) => Message.fromJson(
                    json: json,
                    myUserId: myUserId,
                  ),
                )
                .toList(),
          );
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully fetched messages',
        'data': messagesSubscription,
      };
    } catch (error) {
      return {
        'success': false,
        'status': 500,
        'message': error.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> sendMessage({required Message message}) async {
    try {
      final data = await supabase.from('messages').insert(message.toJson());
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully sent message',
        'data': data,
      };
    } on PostgrestException catch (error) {
      return {
        'success': false,
        'status': int.parse(error.code.toString()),
        'message': error.message,
      };
    } catch (error) {
      return {
        'success': false,
        'status': 500,
        'message': error.toString(),
      };
    }
  }
}
