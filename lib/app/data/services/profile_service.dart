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
        'status': int.parse(error.statusCode ?? '400'),
        'message': error.message.toString(),
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
  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully signed in',
      };
    } on AuthException catch (error) {
      return {
        'success': false,
        'status': int.parse(error.statusCode ?? '400'),
        'message': error.message.toString(),
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
  Future<Map<String, dynamic>> signOut() async {
    try {
      await supabase.auth.signOut();
      return {
        'success': true,
        'status': 200,
        'message': 'Successfully signed out',
      };
    } on AuthException catch (error) {
      return {
        'success': false,
        'status': int.parse(error.statusCode ?? '400'),
        'message': error.message.toString(),
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
