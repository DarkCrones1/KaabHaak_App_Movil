import 'dart:convert';


CategoryResponseDto categoryResponseDtoFromJson(String str) => CategoryResponseDto.fromJson(json.decode(str));

String categoryResponseDtoToJson(CategoryResponseDto data) => json.encode(data.toJson());

class CategoryResponseDto {

    CategoryResponseDto({
        required this.id,
        required this.name,
        required this.description,
        required this.image
    });

    final int id;
    final String name;
    final String description;
    final String image;

    factory CategoryResponseDto.fromJson(Map<String, dynamic> json) => CategoryResponseDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
    };
}