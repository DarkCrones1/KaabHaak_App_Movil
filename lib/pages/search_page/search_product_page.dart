import 'package:flutter/material.dart';
import 'package:kaabhaak/widget/product/product_gridview_search.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({super.key, required this.nameSearch});

  final String nameSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda'),
      ),
      body: ProductGridViewSearch(name: nameSearch)
    );
  }
}