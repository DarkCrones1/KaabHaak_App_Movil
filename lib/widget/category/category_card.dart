import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard
  ({
    super.key,
    required this.image,
    required this.routeName,
  });

  final String image;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/page_category_$routeName'),
      child: Card(
        child: FadeInImage.assetNetwork(
          placeholder: 'iamges/loading.gif',
          image: image,
          fit: BoxFit.cover
        ),
      ),
    );
  }
}