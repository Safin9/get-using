import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FuturesScreenView extends StatelessWidget {
  const FuturesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('futures'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: FutureBuilder(
                  future: waitForFiveSec(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      //we are
                      return const Text(
                          'Loading ... '); // indicate loading widget
                    }
                    if (snapshot.data == true) {}
                    return const Text(
                      'Hello',
                      style: TextStyle(fontSize: 28),
                    );
                  },
                ),
              ),
              Expanded(
                  child: Container(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: fetchPostsFromApi(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator()); //loading
                    } else if (snap.hasError) {
                      return Text(snap.error.toString());
                    } else if (snap.data == null) {
                      return const Text('no data');
                    }
                    return ListView.builder(
                        itemCount: snap.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              snap.data![index]["title"].toString(),
                            ),
                          );
                        });
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  // wait for five seconds
  Future waitForFiveSec() async {
    return await Future.delayed(const Duration(seconds: 5))
        .then((value) => true);
  }

  // get a list of posts from this url https://jsonplaceholder.typicode.com/posts

  Future<List<Map<String, dynamic>>> fetchPostsFromApi() async {
    const String apiEndpoint = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(apiEndpoint));
    var decodedJson = json.decode(response.body);
    List<Map<String, dynamic>> listOfPosts =
        decodedJson.cast<Map<String, dynamic>>();

    print(listOfPosts[0]["title"].toString());
    return listOfPosts;
  }
}
