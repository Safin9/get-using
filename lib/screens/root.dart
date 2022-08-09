import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:in_class_asssignment/controller/binding.dart';
import 'package:in_class_asssignment/screens/showing_num_test.dart';
import 'package:in_class_asssignment/screens/upload_file.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialBinding: Binds(), home: const NumTest());
  }
}
