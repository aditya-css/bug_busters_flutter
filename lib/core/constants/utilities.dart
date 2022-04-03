import 'package:flutter/material.dart';

class AppUtils {
  static TextStyle kMyFormTextStyle = TextStyle(
    fontSize: 16,
    // color: AppColors.kPrimary,
    color: Colors.grey.shade600,
  );

//Regular Expressions for user input validation.
  static final RegExp _emailRegex = RegExp(
      r'^[a-zA-z0-9#.+-]{1,}@[a-zA-z.-]{1,}[.]{1,}[a-zA-Z]{2,}[a-zA-Z]*$');
  static final RegExp _nameRegex = RegExp(r"^[\p{L}]{1,}[\p{L} ,.'-]*$",
      caseSensitive: false, unicode: true, dotAll: true);
  static final RegExp _passRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.+!@#=\$&*~-]).{8,}$');

  static String? nameValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Required Field!';
    } else if (!_nameRegex.hasMatch(value)) {
      return 'Invalid Input!';
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Required Field!';
    } else if (!_emailRegex.hasMatch(value)) {
      return 'Invalid Input!';
    } else {
      return null;
    }
  }

  static String? passValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Required Field!';
    } else if (!value.contains(RegExp(r'[A-Z]{1,}'))) {
      return 'Missing one uppercase letter!';
    } else if (!value.contains(RegExp(r'[a-z]{1,}'))) {
      return 'Missing one lowercase letter!';
    } else if (!value.contains(RegExp(r'[0-9]{1,}'))) {
      return 'Missing one numeric character!';
    } else if (!value.contains(RegExp(r'[.+!@#=\$&*~-]{1,}'))) {
      return 'Missing one special character!';
    } else if (value.length < 8) {
      return 'Required minimum length is 8!';
    } else if (!_passRegex.hasMatch(value)) {
      return 'Invalid Input!';
    } else {
      return null;
    }
  }
}
