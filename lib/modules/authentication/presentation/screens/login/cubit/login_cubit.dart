import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intikom_app/infrastructure/types/resource.dart';
import 'package:intikom_app/modules/authentication/domain/model/user_session.dart';
import 'package:intikom_app/modules/authentication/domain/usecases/login.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final Login _login;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey formKey = GlobalKey();
  LoginCubit(this._login) : super(LoginInIdle());

  void login() async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _login(
        LoginParams(username: email.text, password: password.text));
    switch (result) {
      case Success(data: UserSession data):
        emit(LoginSuccess(data));
      case Error():
        emit(LoginError(result.exception.message));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();

    return super.close();
  }
}
