import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:in_class_asssignment/screens/screen_mode_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storage.initStorage;
  storage.write('lightheme', true);
  runApp(const ThemeScreen());
}

final storage = GetStorage();
