
import 'package:flutter/material.dart';
import 'package:kaabhaak/widget/product/product_gridview_filter.dart';

class PageNature extends StatelessWidget {
  const PageNature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos Naturales'),
      ),
      // body:  const ProductListViewNature()
      body: const ProductGridView(category: 'Natural'),
    );
  }
}