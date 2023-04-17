import 'dart:convert';


CategoryRequestDto categoryRequestDtoFromJson(String str) => CategoryRequestDto.fromJson(json.decode(str));

String categoryRequestDtoToJson(CategoryRequestDto data) => json.encode(data.toJson());

class CategoryRequestDto {

    CategoryRequestDto({
        required this.name,
        required this.description,
        required this.imageURL
    });

    final String name;
    final String description;
    final String imageURL;

    factory CategoryRequestDto.fromJson(Map<String, dynamic> json) => CategoryRequestDto(
        name: json["name"],
        description: json["description"],
        imageURL: json["imageURL"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "imageURL": imageURL,
    };
}