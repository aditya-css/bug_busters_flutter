// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<IconData>? _$passwordIconComputed;

  @override
  IconData get passwordIcon =>
      (_$passwordIconComputed ??= Computed<IconData>(() => super.passwordIcon,
              name: '_LoginStore.passwordIcon'))
          .value;
  Computed<String>? _$passTooltipComputed;

  @override
  String get passTooltip =>
      (_$passTooltipComputed ??= Computed<String>(() => super.passTooltip,
              name: '_LoginStore.passTooltip'))
          .value;
  Computed<bool>? _$isLoginStateComputed;

  @override
  bool get isLoginState =>
      (_$isLoginStateComputed ??= Computed<bool>(() => super.isLoginState,
              name: '_LoginStore.isLoginState'))
          .value;

  final _$_showPasswordAtom = Atom(name: '_LoginStore._showPassword');

  bool get showPassword {
    _$_showPasswordAtom.reportRead();
    return super._showPassword;
  }

  @override
  bool get _showPassword => showPassword;

  @override
  set _showPassword(bool value) {
    _$_showPasswordAtom.reportWrite(value, super._showPassword, () {
      super._showPassword = value;
    });
  }

  final _$profilePicAtom = Atom(name: '_LoginStore.profilePic');

  @override
  FilePickerResult? get profilePic {
    _$profilePicAtom.reportRead();
    return super.profilePic;
  }

  @override
  set profilePic(FilePickerResult? value) {
    _$profilePicAtom.reportWrite(value, super.profilePic, () {
      super.profilePic = value;
    });
  }

  final _$_screenStateAtom = Atom(name: '_LoginStore._screenState');

  LoginScreenState get screenState {
    _$_screenStateAtom.reportRead();
    return super._screenState;
  }

  @override
  LoginScreenState get _screenState => screenState;

  @override
  set _screenState(LoginScreenState value) {
    _$_screenStateAtom.reportWrite(value, super._screenState, () {
      super._screenState = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void togglePassword() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.togglePassword');
    try {
      return super.togglePassword();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleScreenState() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.toggleScreenState');
    try {
      return super.toggleScreenState();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profilePic: ${profilePic},
passwordIcon: ${passwordIcon},
passTooltip: ${passTooltip},
isLoginState: ${isLoginState}
    ''';
  }
}
