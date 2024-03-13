import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_client/api_config/endpoint.dart';
import 'package:http_client/api_config/http_method.dart';
import 'package:http_client/api_config/path.dart';
import 'package:http_client/api_models/dogs.dart';

void main(List<String> arguments) {
  final endpointTest = Endpoint(path: Path.dogs, httpMethod: HttpMethod.get);

  print(endpointTest.path.fullPath);
  print(endpointTest.getAllHeaders());
  print(endpointTest.httpMethod.toString());
  /*final url = 'https://jsonblob.com/api/1151549092634943488';
  http.get(Uri.parse(url)).then((res) {
    final List<dynamic> bodyData = jsonDecode(res.body);
    final List<DogResponse> myDogsParsed = [];
    for (var dog in bodyData) {
      DogResponse dogItem = DogResponse.fromJson(dog);
      myDogsParsed.add(dogItem);
    }
    print(myDogsParsed);
  });*/
}
