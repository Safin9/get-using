import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersListView extends StatelessWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> fetchdata() async {
      const String apiEndpoint = "https://jsonplaceholder.typicode.com/users";
      http.Response response = await http.get(Uri.parse(apiEndpoint));

      var decodedJson = json.decode(response.body);

      List<Map<String, dynamic>> listOfPosts =
          decodedJson.cast<Map<String, dynamic>>();

      return listOfPosts;
    }
    // Future< List<User>> users =fetchdata.json((e) {
    //     return User.fromJson(e);
    //   }).toList();

    return Container();
  }
}
