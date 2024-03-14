
class DogResponse {
  String? dogName;
  String? description;
  int? age;
  String? image;

  DogResponse({
    this.dogName,
    this.description,
    this.age,
    this.image,
  });

  factory DogResponse.fromJson(Map<String, dynamic> json) => DogResponse(
        dogName: json['dogName'],
        description: json['description'],
        age: json['age'],
        image: json['image'],
      );
}
