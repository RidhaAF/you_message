abstract class ProfileRepository {
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String username,
  });
}
