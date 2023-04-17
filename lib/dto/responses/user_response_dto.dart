import 'dart:convert';

UserResponseDto userResponseDtoFromJson(String str) => UserResponseDto.fromJson(json.decode(str));

String userResponseDtoToJson(UserResponseDto data) => json.encode(data.toJson());

class UserResponseDto{
    UserResponseDto
    ({
      required this.email,
      required this.password,
    });

    final String email;
    final String password;

    factory UserResponseDto.fromJson(Map<String, dynamic> json) => UserResponseDto(
      email: json["email"],
      password: json["password"]
    );

    Map<String, dynamic> toJson() => {
      "email": email,
      "password": password,
    };
}