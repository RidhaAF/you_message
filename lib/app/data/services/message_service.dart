import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/models/profile.dart';
import 'package:you_message/app/data/repositories/message_repository.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class MessageService implements MessageRepository {
  final myUserId = supabase.auth.currentUser!.id;

  @override
  Future<Map<String, dynamic>> messageByUserId() async {
    try {
      final message = supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .order('created_at')
          .map(
            (maps) => maps
                .map(
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
        'data': message,
      };
    } catch (error) {
      return {
        'success': false,
        'status': 500,
        'message': error,
      };
    }
  }

  @override
  Future<Map<String, dynamic>> loadProfileCache(
      {required String profileId}) async {
    try {
      final data =
          await supabase.from('profiles').select().eq('id', profileId).single();
      final profile = Profile.fromJson(data);
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully fetched profile',
        'data': profile,
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
  Future<Map<String, dynamic>> sendMessage({required String content}) async {
    try {
      final data = await supabase.from('messages').insert({
        'profile_id': myUserId,
        'content': content,
      });
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
