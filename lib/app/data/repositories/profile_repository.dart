abstract class ProfileRepository {
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String username,
  });

  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> signOut();

  Future<Map<String, dynamic>> getProfile({required String profileId});
}
