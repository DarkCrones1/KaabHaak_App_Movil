
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaabhaak/dto/responses/user_data_responses_dto.dart';
import 'package:kaabhaak/providers/user_providers/user_login_provider.dart';
import 'package:logger/logger.dart';

class UserDataProvider extends ChangeNotifier{
  final logger = Logger();

  UserDataResponseDto? _userData;
  bool isloading = true;
  UserDataResponseDto? get userData => _userData;

  Future fetchUserData() async{
    final userDataToken = UserLoginProvider();
    final token = await userDataToken.getAuthToken();


    final response = await http.get(Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/UserData'),
    headers: <String, String>{
      'accept': 'text/plain',
      'Authorization': 'Bearer $token'
    });

      logger.d(response.statusCode);
      logger.d(response.body);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      final data = json;


      _userData = UserDataResponseDto.fromJson(data);

      isloading = false;
      notifyListeners();
    }else{
      throw Exception('Failed to load Data');
    }
  }
}