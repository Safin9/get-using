import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_class_asssignment/screens/list_of_users.dart';

import '../controller/test_controller.dart';

class NumTest extends StatelessWidget {
  const NumTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numcontroller = Get.put(NumberTest());
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(numcontroller.number.string.obs.toString()),
            ElevatedButton(
                onPressed: () {
                  numcontroller.increament();
                  print(numcontroller.number);
                },
                child: const Text('increament')),
            Text(numcontroller.number.toString()),
            Obx((() {
              return Text(numcontroller.number.toString());
            })),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => ListOfUser());
                },
                child: const Text('go')),
          ],
        ),
      ),
    );
  }
}
