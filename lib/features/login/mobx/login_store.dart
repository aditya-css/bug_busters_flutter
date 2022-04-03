import 'dart:io';

import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:bug_busters_flutter/features/homepage/mobx/login_check_store.dart';
import 'package:bug_busters_flutter/models/login_request_model.dart';
import 'package:bug_busters_flutter/models/user_model.dart';
import 'package:bug_busters_flutter/models/user_response_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:retrofit/dio.dart';

import '../../../models/login_response_model.dart';

part 'login_store.g.dart';

enum LoginScreenState { login, signup }

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginCheckStore _loginCheck;

  _LoginStore(LoginCheckStore loginCheck) : _loginCheck = loginCheck;

  @readonly
  bool _showPassword = false;

  @readonly
  bool _isLoading = false;

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

  @action
  Future<String> userLogin(LoginRequest req) async {
    _isLoading = true;
    HttpResponse<LoginResponse> res = await ApiConst.client.loginUser(req);
    _isLoading = false;
    if (res.response.statusCode == HttpStatus.ok) {
      _loginCheck.setUserToken(res.response.data.token);
      return res.response.data.token;
    }
    return 'failed';
  }

  @action
  Future<bool> userRegister(UserModel user) async {
    _isLoading = true;
    HttpResponse<UserResponseModel> res =
        await ApiConst.client.registerUser(user);
    _isLoading = false;
    if (res.response.statusCode == HttpStatus.ok) {
      toggleScreenState();
      return true;
    }
    return false;
  }
}
