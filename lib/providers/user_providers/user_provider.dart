
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kaabhaak/dto/requests/user_create_request_dto.dart';
import 'package:kaabhaak/dto/responses/user_response_dto.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier{

  final logger = Logger();

  List<UserResponseDto>? _users;
  bool isloading = true;
  List<UserResponseDto>? get users =>_users;

  Future fetchUser() async {
    final response = await http.get(Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/Account'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['data'];

      _users = data.map((user) => UserResponseDto.fromJson(user)).toList();

      isloading = false;

      notifyListeners(); // Notificar cambios
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future createUser(String email, String password, BuildContext context) async{
    final user = UserCreateRequestDto(email: email, password: password);

    final response = await http.post(
      Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/Account/Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );


    if (response.statusCode == 200) {
      logger.d('User created: ${response.body}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User created!')),
        );
        Navigator.pop(context);
      }
    } else {
      logger.e('Error: {El correo o contraseña es incorrecta}');
          if (context.mounted) {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Elija un correo válido"),
                actions: [
                  TextButton(
                    child: const Text("Cerrar"),
                    onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void logout(){
    
  }

}