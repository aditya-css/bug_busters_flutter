import 'dart:html';

import 'package:bug_busters_flutter/core/constants/resources.dart';
import 'package:mobx/mobx.dart';

part 'login_check_store.g.dart';

class LoginCheckStore = _LoginCheckStore with _$LoginCheckStore;

abstract class _LoginCheckStore with Store {
  @readonly
  bool _isLoggedIn = false;

  @action
  void checkLogin() =>
      _isLoggedIn = window.localStorage[AppStrings.kUserTokenName] == null;

  @action
  void setUserToken(String token) =>
      window.localStorage[AppStrings.kUserTokenName] = token;
}
