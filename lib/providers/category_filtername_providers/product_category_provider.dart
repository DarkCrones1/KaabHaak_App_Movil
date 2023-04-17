import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaabhaak/dto/responses/product_responses_dto.dart';
import 'package:logger/logger.dart';

class ProductCategoryProvider extends ChangeNotifier {

  final logger = Logger();
  List<ProductResponseDto>? _productCategory;
  bool isloading = true;
  List<ProductResponseDto>? get product => _productCategory;

  Future fetchProductCategory(String category) async{
    final response = await http.get(Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/Product/Category?category=$category'));

    logger.d(response.statusCode);
    logger.d(response.body);

    if (response.statusCode == 200){

      final json = jsonDecode(response.body);
      final List<dynamic> data = json;

      _productCategory = data.map((product) => ProductResponseDto.fromJson(product)).toList();

      isloading = false;
      notifyListeners();
    }else{
      throw Exception('Failer to load');
    }
  }
}