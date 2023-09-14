abstract class RoomsRepository {
  Future<Map<String, dynamic>> initializeRooms();

  Future<Map<String, dynamic>> roomsSubscription();

  Future<Map<String, dynamic>> newestMessage({required String roomId});

  Future<Map<String, dynamic>> createRoom({required String otherUserId});
}
