import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage box = GetStorage();
  final _key = 'IsDarkMode';

  _saveThemeDataInBox(bool isDarkMode) {
    box.write(_key, isDarkMode);
  }

  bool _getThemeDataFromBox() {
    return box.read<bool>(_key) ?? false;
  }

  ThemeMode get themeData =>
      _getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void ChangeTheme() {
    Get.changeThemeMode(
        _getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeDataInBox(!_getThemeDataFromBox());
  }
}
