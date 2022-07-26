import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_class_asssignment/main.dart';

class ThemeController extends GetxController {
  bool get isDark => storage.read('darkmode') ?? false;

  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();

  void changeTheme(bool val) async {
    await storage.write('darkmode', val);
    print('Changed');
  }

  @override
  void onInit() async {
    print(storage.read('darkmode'));
  }
}
