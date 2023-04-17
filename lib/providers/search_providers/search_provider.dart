import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kaabhaak/dto/responses/product_responses_dto.dart';
import 'package:logger/logger.dart';

class SearchProvider extends ChangeNotifier {
  final logger = Logger();
  List<ProductResponseDto>? _productFilter;
  bool isloading = true;
  List<ProductResponseDto>? get product => _productFilter;

  Future fetchProductFilter(String name) async{
    final response = await http.get(Uri.parse('http://beehakk.somee.com/API_Bee_Haak/Product/Name?Name=$name'));

    logger.d(response.statusCode);
    logger.d(response.body);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;

      _productFilter = data.map((product) => ProductResponseDto?.fromJson(product)).toList();

      isloading = false;
      notifyListeners();
    }else{
      throw Exception('Failer to load');
    }
  }
}