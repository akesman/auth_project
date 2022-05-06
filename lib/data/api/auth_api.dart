import 'package:auth_project/data/api/database_api.dart';
import 'package:supabase/supabase.dart';

class AuthApi {
  final DatabaseApi databaseApi;

  AuthApi(this.databaseApi);

  Future<GotrueSessionResponse> signUpUser(
      String email, String password) async {
    final result =
        await databaseApi.getSupabaseClient().auth.signUp(email, password);

    return result;
  }

  Future<GotrueSessionResponse> signInUser(
      String email, String password) async {
    return await databaseApi
        .getSupabaseClient()
        .auth
        .signIn(email: email, password: password);
  }

  Future<GotrueResponse> logout() async {
    return await databaseApi.getSupabaseClient().auth.signOut();
  }
}
