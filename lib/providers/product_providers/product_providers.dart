import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaabhaak/dto/responses/product_responses_dto.dart';
import 'package:logger/logger.dart';

class ProductProvider extends ChangeNotifier {

  final logger = Logger();
  List<ProductResponseDto>? _product;
  bool isloading = true;
  List<ProductResponseDto>? get product => _product;

  Future fetchProduct() async {
    final response = await http.get(Uri.parse('http://kaabstore.somee.com/WebAPI_Kaab_Haak/Product'));

    logger.d(response.statusCode);
    logger.d(response.body);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);

      // final data = List.from(json);
      final List<dynamic> data = json;

      _product = data.map((product) => ProductResponseDto.fromJson(product)).toList();

      isloading = false;
      notifyListeners();
    }else{
      throw Exception('Failer to load');
    }
  }
}