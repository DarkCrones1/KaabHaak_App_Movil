

import 'package:flutter/material.dart';
import 'package:kaabhaak/widget/product/product_gridview_filter.dart';

class PageBeauty extends StatelessWidget {
  const PageBeauty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos de Belleza'),
      ),
      // body:  const ProductListViewBeauty()
      body: const ProductGridView(category: 'Belleza'),
    );
  }
}