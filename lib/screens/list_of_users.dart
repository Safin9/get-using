import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListOfUser extends StatelessWidget {
  const ListOfUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          createuser(controller: namecontroller.value.text);
        }),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
              ),
              FutureBuilder<String>(
                  future: getusers(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return const Text('has data');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('it has error${snapshot.error}');
                    }
                    return const Text('something went wrong!!');
                  }))
            ],
          ),
        ),
      ),
    );
  }

  Future createuser({required String controller}) async {
    final doc = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      "name": controller,
      "age": 5,
    };
    await doc.set(json);
  }

  Future<String> getusers() async {
    final doc = FirebaseFirestore.instance.collection('users').doc();
    final users = await doc.get();
    return users.toString();
  }
}
