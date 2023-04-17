
import 'dart:convert';
import 'brand_responses_dto.dart';
import 'category_responses_dto.dart';

ProductResponseDto productResponseDtoFromJson(String str) => ProductResponseDto.fromJson(json.decode(str));

String productResponseDtoToJson(ProductResponseDto data) => json.encode(data.toJson());

class ProductResponseDto {
    ProductResponseDto({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.price,
        required this.quantity,
        required this.brand,
        required this.category,
    });

    final int id;
    final String name;
    final String description;
    final String image;
    final int price;
    final int quantity;
    final BrandResponseDto brand;
    final CategoryResponseDto category;

    factory ProductResponseDto.fromJson(Map<String, dynamic> json) => ProductResponseDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
        brand: BrandResponseDto.fromJson(json["brand"]),
        category: CategoryResponseDto.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "quantity": quantity,
        "brand": brand.toJson(),
        "category": category.toJson(),
    };
}

