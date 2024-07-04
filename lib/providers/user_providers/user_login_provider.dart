
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kaabhaak/dto/responses/user_response_dto.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;  

class UserLoginProvider extends ChangeNotifier{

  final logger = Logger();
  final storage = const FlutterSecureStorage();

  List<UserResponseDto>? _users;
  bool isloading = true;
  List<UserResponseDto>? get users => _users;

  Future loginUser(String email, String password, BuildContext context) async{
    final user = UserResponseDto(email: email, password: password);

    final response = await http.post(
      Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/Account/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user));

      if (response.statusCode == 200){
        if (context.mounted){
          final json = jsonDecode(response.body)['token'];
          await storage.write(key: 'token', value: json);
          // final token = await getAuthToken();
          // logger.d('token almacenado es: $token');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bienvenid@ ${user.email}")));
          Navigator.restorablePushNamedAndRemoveUntil(context, '/home_navbar_user', (route) => false);
          }
        }else{
          logger.e('Error: {El correo o contraseña es incorrecta}');
          if (context.mounted) {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("El correo o contraseña es incorrecta"),
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
  Future<String?> getAuthToken() async{
    return storage.read(key: 'token');
  }
  Future clearAuthToken() async{
    return storage.delete(key: 'token');
  }
}