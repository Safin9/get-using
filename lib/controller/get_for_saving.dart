import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyThemes extends GetxController {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.red[900],
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 182, 182, 182),
  );
}
