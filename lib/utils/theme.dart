import 'package:flutter/material.dart';

import 'constants.dart';

class Themes{
  static final light=ThemeData(
    primaryColor: primary,
    backgroundColor: LightColor,
    brightness: Brightness.light

  );
  static final dark=ThemeData(
    primaryColor: primary,
    backgroundColor: darkColor,
    brightness: Brightness.dark
  );
}