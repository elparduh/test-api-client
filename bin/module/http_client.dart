import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_client/api_builder/http_client_builder.dart';
import '../endpoint/dogs_endpoint.dart';
import 'data/dogs_api_model.dart';

void main(List<String> arguments) {
  final httpClientBuilder = HttpClientBuilder(http.Client());

  final httpResponse = httpClientBuilder.request(endpoint: DogEndpoint.getDogs());
  httpResponse.then((res) {
    final List<dynamic> bodyData = jsonDecode(res.body);
    final List<DogResponse> myDogsParsed = [];
    for (var dog in bodyData) {
      DogResponse dogItem = DogResponse.fromJson(dog);
      myDogsParsed.add(dogItem);
    }
    print(myDogsParsed);
  });
}