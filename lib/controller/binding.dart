import 'package:get/get.dart';
import 'package:in_class_asssignment/controller/mythemese.dart';
import 'package:in_class_asssignment/controller/theme_controller.dart';

class Binds extends Bindings {
  @override
  void dependencies() {
    Get.put(MyThemes());
    Get.put(ThemeController());
  }
}
