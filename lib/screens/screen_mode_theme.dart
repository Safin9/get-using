import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_class_asssignment/controller/theme_controller.dart';
import 'package:in_class_asssignment/screens/getting_data_from_API.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    final theme = Get.find<ThemeController>();
    return SimpleBuilder(
      builder: (contextt) {
        return GetMaterialApp(
          theme: theme.theme,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('theme screen'),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.to(const ApiData());
                      },
                      child: const Text('data')),
                  SwitchListTile(
                    value: theme.isDark,
                    title: const Text("Touch to change ThemeMode"),
                    onChanged: theme.changeTheme,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
