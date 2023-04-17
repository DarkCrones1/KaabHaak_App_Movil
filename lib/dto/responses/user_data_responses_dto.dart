
import 'dart:convert';

UserDataResponseDto userDataResponseDtoFromJson(String str) => UserDataResponseDto.fromJson(json.decode(str));

String userDataResponseDtoToJson(UserDataResponseDto data) => json.encode(data.toJson());

class UserDataResponseDto {
    UserDataResponseDto({
        required this.firstName,
        required this.lastName,
        required this.cellPhoneNumber,
        required this.image,
        required this.bornDate,
    });

    final String firstName;
    final String lastName;
    final String cellPhoneNumber;
    final String image;
    final DateTime bornDate;

    factory UserDataResponseDto.fromJson(Map<String, dynamic> json) => UserDataResponseDto(
        firstName: json["firstName"],
        lastName: json["lastName"],
        cellPhoneNumber: json["cellPhoneNumber"],
        image: json["image"],
        bornDate: DateTime.parse(json["bornDate"]),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "cellPhoneNumber": cellPhoneNumber,
        "image": image,
        "bornDate": bornDate.toIso8601String(),
    };
}