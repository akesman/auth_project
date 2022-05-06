import 'package:auth_project/data/api/auth_api.dart';
import 'package:logger/logger.dart';
import 'package:supabase/supabase.dart';

class AuthService {
  final Logger log = Logger(printer: SimplePrinter());

  final AuthApi authApi;

  AuthService(this.authApi);

  Future<GotrueSessionResponse> signUpUser(
      String email, String password) async {
    return await authApi.signUpUser(email, password);
  }

  Future<GotrueSessionResponse> signInUser(
      String email, String password) async {
    return await authApi.signInUser(email, password);
  }

  Future<GotrueResponse> logout() async {
    return await authApi.logout();
  }
}
