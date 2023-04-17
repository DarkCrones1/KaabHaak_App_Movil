
import 'package:flutter/material.dart';
import 'package:kaabhaak/widget/product/product_gridview_filter.dart';

class PageCandy extends StatelessWidget {
  const PageCandy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dulces de Miel'),
      ),
      // body:  const ProductListViewCandy(),
      body: const ProductGridView(category: 'Dulces'),
    );
  }
}