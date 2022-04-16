import 'package:demoapp/Model/DemoModel.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<DemoModel>?> fetchDataService() async {
    var client = http.Client();

    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return demoModelFromJson(json);
    }
  }
}
