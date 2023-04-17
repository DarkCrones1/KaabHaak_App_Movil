// ignore_for_file: file_names

import 'dart:convert';

ItemCreateRequestDto itemCreateRequestDtoFromJson(String str) => ItemCreateRequestDto.fromJson(json.decode(str));

String itemCreateRequestDtoToJson(ItemCreateRequestDto data) => json.encode(data.toJson());

class ItemCreateRequestDto {
    ItemCreateRequestDto({
        required this.quantity,
        required this.productId,
    });

    final int quantity;
    final int productId;

    factory ItemCreateRequestDto.fromJson(Map<String, dynamic> json) => ItemCreateRequestDto(
        quantity: json["quantity"],
        productId: json["productId"],
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "productId": productId,
    };
}