import 'package:http/http.dart' as http;

import 'package:in_class_asssignment/modules/model_for_kurdishnames.dart';

class KurdishNameService {
  Future<KurdishNames> fetchdata() async {
    http.Response response = await http
        .get(Uri.parse('https://nawikurdi.com/api?limit=10&gender=F&offset=0'));

    KurdishNames kurdishNames = KurdishNames.fromJson(response.body);

    return kurdishNames;
  }
}
