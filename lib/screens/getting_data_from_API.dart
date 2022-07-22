import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiData extends StatelessWidget {
  const ApiData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return SizedBox(
                    child: Column(
                      children: [
                        Text(user['name']),
                        Text(user['username']),
                        Text(user['email']),
                        Text(user['name']),
                        Text(user['address']['street']),
                        Text(user['id'].toString()),
                        const SizedBox(height: 80)
                      ],
                    ),
                  );
                  // ListTile(
                  //   title: Text(post["id"].toString()),
                  // );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  //fetch data from API
  Future<List<Map<String, dynamic>>> fetchdata() async {
    const String apiEndpoint = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(apiEndpoint));

    var decodedJson = json.decode(response.body);

    List<Map<String, dynamic>> listOfPosts =
        decodedJson.cast<Map<String, dynamic>>();

    return listOfPosts;
  }
}
