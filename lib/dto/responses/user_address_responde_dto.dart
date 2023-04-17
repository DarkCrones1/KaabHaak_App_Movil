
import 'dart:convert';

UserAddressResponseDto userAddressResponseDtoFromJson(String str) => UserAddressResponseDto.fromJson(json.decode(str));

String userAddressResponseDtoToJson(UserAddressResponseDto data) => json.encode(data.toJson());

class UserAddressResponseDto {
    UserAddressResponseDto({
        required this.streetAddres,
        required this.exteriorNumber,
        required this.interiorNumber,
        required this.postalCode,
        required this.town,
        required this.city,
    });

    final String streetAddres;
    final String exteriorNumber;
    final String interiorNumber;
    final String postalCode;
    final String town;
    final String city;

    factory UserAddressResponseDto.fromJson(Map<String, dynamic> json) => UserAddressResponseDto(
        streetAddres: json["streetAddres"],
        exteriorNumber: json["exteriorNumber"],
        interiorNumber: json["interiorNumber"],
        postalCode: json["postalCode"],
        town: json["town"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "streetAddres": streetAddres,
        "exteriorNumber": exteriorNumber,
        "interiorNumber": interiorNumber,
        "postalCode": postalCode,
        "town": town,
        "city": city,
    };
}
