import 'package:get/get.dart';

class NumberTest extends GetxController {
  RxInt number = 0.obs;
  void increament() {
    number++;
    update();
  }
}
