abstract class MessageRepository {
  Future<Map<String, dynamic>> messageByUserId();

  Future<Map<String, dynamic>> loadProfileCache({required String profileId});

  Future<Map<String, dynamic>> sendMessage({required String content});
}
