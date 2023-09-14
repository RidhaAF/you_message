import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/repositories/rooms_repository.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class RoomService implements RoomsRepository {
  final myUserId = supabase.auth.currentUser!.id;

  @override
  Future<Map<String, dynamic>> initializeRooms() async {
    try {
      final data = await supabase
          .from('profiles')
          .select()
          .not('id', 'eq', myUserId)
          .order('created_at')
          .limit(12);
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully fetched rooms',
        'data': data,
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
  Future<Map<String, dynamic>> roomsSubscription() async {
    try {
      final rawRoomsSubscription = supabase.from('room_participants').stream(
        primaryKey: ['room_id', 'profile_id'],
      );
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully fetched rooms subscription',
        'data': rawRoomsSubscription,
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
  Future<Map<String, dynamic>> newestMessage({required String roomId}) async {
    try {
      final messageSubscriptions = supabase
          .from('messages')
          .stream(primaryKey: ['id'])
          .eq('room_id', roomId)
          .order('created_at')
          .limit(1)
          .map<Message?>(
            (data) => data.isEmpty
                ? null
                : Message.fromJson(
                    json: data.first,
                    myUserId: myUserId,
                  ),
          );
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully fetched newest message',
        'data': messageSubscriptions,
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
  Future<Map<String, dynamic>> createRoom({required String otherUserId}) async {
    try {
      final data = await supabase.rpc(
        'create_new_room',
        params: {'other_user_id': otherUserId},
      );
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully created room',
        'data': data as String,
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
