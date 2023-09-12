import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:you_message/app/data/repositories/profile_repository.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class ProfileService implements ProfileRepository {
  @override
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
        },
      );
      return {
        'success': true,
        'status': 201,
        'message': 'Successfully created user',
      };
    } on AuthException catch (error) {
      return {
        'success': false,
        'status': 400,
        'message': error,
      };
    } catch (error) {
      return {
        'success': false,
        'status': 500,
        'message': error,
      };
    }
  }
}
