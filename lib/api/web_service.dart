import 'package:covid_data_app/utils/resource.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<T> load<T>(CovidResource<T> resource) async {
    final response = await http.get(resource.url);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
