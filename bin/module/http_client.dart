import 'dart:convert';
import 'package:http_client/api_builder/http_client_builder.dart';
import 'package:http_client/api_config/http_response_status.dart';
import '../endpoint/dogs_endpoint.dart';
import 'data/dogs_api_model.dart';

Future<void> main(List<String> arguments) async {
  final httpClientBuilder = HttpClientBuilder();

  try {
    final httpResponse =
        await httpClientBuilder.get(endpoint: DogEndpoint.getDogs());
    print(httpResponse);
  } on HttpRequestStatus catch (error) {
    print(error.message);
    rethrow;
  } on Exception catch (e) {
    throw httpClientBuilder.createRequestStatusFrom(e);
  }

  /*httpResponse.then((res) {
    final List<dynamic> bodyData = jsonDecode(res.body);
    final List<DogResponse> myDogsParsed = [];
    for (var dog in bodyData) {
      DogResponse dogItem = DogResponse.fromJson(dog);
      myDogsParsed.add(dogItem);
    }
    print(myDogsParsed);
  });*/
}
