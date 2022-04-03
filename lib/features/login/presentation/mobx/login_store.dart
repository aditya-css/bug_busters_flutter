import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

enum LoginScreenState { login, signup }

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @readonly
  bool _showPassword = false;

  @computed
  IconData get passwordIcon =>
      _showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

  @computed
  String get passTooltip => _showPassword ? 'Hide' : 'Show';

  @action
  void togglePassword() => _showPassword = !_showPassword;

  @observable
  FilePickerResult? profilePic;

  @readonly
  LoginScreenState _screenState = LoginScreenState.login;

  @computed
  bool get isLoginState => _screenState == LoginScreenState.login;

  @action
  void toggleScreenState() =>
      _screenState = (_screenState == LoginScreenState.login)
          ? LoginScreenState.signup
          : LoginScreenState.login;
}
