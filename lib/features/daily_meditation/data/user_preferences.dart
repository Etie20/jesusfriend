import 'package:flutter/material.dart';

class UserPreferences {
  static final UserPreferences _singleton = UserPreferences._internal();

  factory UserPreferences() {
    return _singleton;
  }

  UserPreferences._internal();

  late final Color _orange = const Color.fromRGBO(241, 116, 76, 1);

  Color get orange => _orange;

}
