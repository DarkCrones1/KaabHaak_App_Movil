
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaabhaak/dto/responses/user_address_responde_dto.dart';
import 'package:kaabhaak/providers/user_providers/user_login_provider.dart';
import 'package:logger/logger.dart';

class UserAddressProvider extends ChangeNotifier {
  final logger = Logger();

  UserAddressResponseDto? _userAdress;
  bool isloading = true;
  UserAddressResponseDto? get userAdress => _userAdress;

  Future fetchUserAddress() async{
    final userAddresToken = UserLoginProvider();
    final token = await userAddresToken.getAuthToken();

    final response = await http.get(Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/UserAddress'),
    headers: <String, String>{
      'accept': 'text/plain',
      'Authorization': 'Bearer $token'
    });

    logger.d(response.statusCode);
    logger.d(response.body);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      final data = json;

      _userAdress = UserAddressResponseDto.fromJson(data);

      isloading = false;
      notifyListeners();
    }else{
      throw Exception('Failet do load Address');
    }
  }
}