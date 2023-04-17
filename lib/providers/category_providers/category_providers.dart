
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaabhaak/dto/requests/category_create_request_dto.dart';
import 'package:kaabhaak/dto/responses/category_responses_dto.dart';
import 'package:logger/logger.dart';

class CategoryProvider extends ChangeNotifier {
  
  final logger = Logger();
  List<CategoryResponseDto>? _category;
  bool isloading = true;
  List<CategoryResponseDto>? get category => _category;

  Future fetchCategory() async {
    final response = await http.get(Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/Category'));

    logger.d(response.statusCode);
    logger.d(response.body);
    if (response.statusCode == 200){
      
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;
      _category = data.map((category) => CategoryResponseDto.fromJson(category)).toList();

      isloading = false;
      notifyListeners();
    } else {
      throw Exception('Failer to load');
    }
  } 


  Future createCategory(String name, String description, String imageURL, BuildContext context) async {
    final category = CategoryRequestDto(name: name, description: description, imageURL: imageURL);

    final response = await http.post(
      Uri.parse('http://beehakk.somee.com/API_Bee_Haak/Category'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(category),
      );

      if (response.statusCode == 200){
        logger.d('Category Created: ${response.body}');
        if (context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Category Created'))
          );
          Navigator.pop(context);
        }
      } else {
        logger.e('Error: ${response.statusCode}');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text ('Error: ${response.statusCode}')),
          );
        }
      }
  }

}