import 'dart:convert';

UserCreateRequestDto userCreateRequestDtoFromJson(String str) =>
    UserCreateRequestDto.fromJson(json.decode(str));

String userCreateRequestDtoToJson(UserCreateRequestDto data) =>
    json.encode(data.toJson());

class UserCreateRequestDto {
  UserCreateRequestDto({
    required this.email,
    required this.password,
    // required this.name
  });

  final String email;
  final String password;
  // final  String name;

  factory UserCreateRequestDto.fromJson(Map<String, dynamic> json) =>
      UserCreateRequestDto(
        email: json["email"],
        password: json["password"],
        // name: json["name"],

      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        // "name": name,
        
      };
}