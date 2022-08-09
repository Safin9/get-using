import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyThemes extends GetxController {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(41, 45, 62, 255),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 227, 159, 159),
  );
}
