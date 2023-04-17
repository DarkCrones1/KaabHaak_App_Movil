
import 'dart:convert';

BrandResponseDto brandResponseDtoFromJson(String str) => BrandResponseDto.fromJson(json.decode(str));

String brandResponseDtoToJson(BrandResponseDto data) => json.encode(data.toJson());

class BrandResponseDto {
    BrandResponseDto({
        required this.id,
        required this.name,
        required this.image
    });

    final int id;
    final String name;
    final String image;

    factory BrandResponseDto.fromJson(Map<String, dynamic> json) => BrandResponseDto(
        id: json["id"],
        name: json["name"],
        image: json["image"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iamge": image
    };
}