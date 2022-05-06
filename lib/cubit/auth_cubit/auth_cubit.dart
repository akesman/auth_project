import 'package:auth_project/data/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:supabase/supabase.dart' as supa;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late AuthService _authService;

  supa.User? _currentUser;

  AuthCubit(BuildContext context) : super(LoginAuthScreenState()) {
    _authService = Provider.of<AuthService>(context, listen: false);
  }

  openLoginScreen() {
    emit(LoadingAuthScreenState());
    emit(LoginAuthScreenState());
  }

  signUpUser(String email, String password) async {
    emit(LoadingAuthScreenState());
    supa.GotrueSessionResponse response =
        await _authService.signUpUser(email, password);
    if (response.user != null) {
      emit(LoginAuthScreenState(message: "Успешная регистрация"));
    } else if (response.error != null) {
      emit(ErrorAuthScreenState(response.error!.message));
    }
  }

  signInUser(String email, String password) async {
    emit(LoadingAuthScreenState());
    supa.GotrueSessionResponse response =
        await _authService.signInUser(email, password);
    if (response.user != null) {
      _currentUser = response.user;
      emit(AuthenticatedState(_currentUser!));
    } else if (response.error != null) {
      emit(ErrorAuthScreenState(response.error!.message));
    }
  }

  logout() async {
    emit(LoadingAuthScreenState());
    supa.GotrueResponse response = await _authService.logout();
    if (response.error != null) {
      emit(ErrorAuthScreenState(response.error!.message));
    } else {
      emit(LoginAuthScreenState(message: "Вышли"));
    }
  }
}
