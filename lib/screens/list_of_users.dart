import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:in_class_asssignment/controller/test_controller.dart';

class ListOfUser extends StatelessWidget {
  ListOfUser({Key? key}) : super(key: key);
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final msgController = TextEditingController();
    final numcontroller = Get.put(NumberTest());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(numcontroller.number.string);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          createuser(
              controller: namecontroller.value.text,
              msgController: msgController.value.text);
          namecontroller.clear();
          msgController.clear();
        }),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firebaseFirestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('Name:'),
                                    const SizedBox(width: 10),
                                    Text(snapshot.data!.docs[index]
                                        .data()["name"]
                                        .toString())
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text('Message:'),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Wrap(children: [
                                        Text(snapshot.data!.docs[index]
                                            .data()["message"]
                                            .toString()),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }));
                }
                return const Text('no data');
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        label: Text('Name'),
                        fillColor: Colors.white,
                      ),
                      controller: namecontroller,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        label: Text('message'),
                        fillColor: Colors.white,
                      ),
                      controller: msgController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future createuser(
      {required String controller, required String msgController}) async {
    final doc = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      "name": controller,
      "message": msgController,
    };
    await doc.set(json);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getusers() async {
    final doc = FirebaseFirestore.instance.collection('users').doc();
    final users = await doc.get();
    return users;
  }

  Widget getdatausingfuture() {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getusers(),
        builder: ((context, snapshot) {
          final users = snapshot.data;
          if (snapshot.hasData || snapshot.data == null) {
            return Text(users.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('it has error${snapshot.error}');
          }
          return const Text('something went wrong!!');
        }),
      ),
    );
  }
}
