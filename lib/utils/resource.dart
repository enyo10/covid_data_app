import 'package:http/http.dart';

class CovidResource<T> {
  final String url;
  T Function(Response response) parse;

  CovidResource({this.url, this.parse});
}
