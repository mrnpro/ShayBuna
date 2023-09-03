import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.kPrimaryColor),
    useMaterial3: true,
  );
}
