
import 'package:flutter/material.dart';
import 'package:kaabhaak/dto/responses/category_responses_dto.dart';
import 'package:kaabhaak/providers/category_providers/category_providers.dart';
import 'package:provider/provider.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView
  ({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CategoryProvider>(builder: (context, categoryProvider, child) => categoryProvider.isloading ? const Center(child: CircularProgressIndicator())
          :Expanded(
            child: GridView.builder(
            gridDelegate: 
            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3/3
                              ),
            itemCount: categoryProvider.category?.length,
            itemBuilder: ((context, index) => createItemCard(context, categoryProvider.category![index]))
              ),
            )
          ),
        ],
      ),
    );
  }

  createItemCard(BuildContext context, CategoryResponseDto category) => 
  GestureDetector(
    onTap: () => Navigator.pushNamed(context, '/page_category_${category.name}'),
      child: Stack(
        children: [
          FadeInImage.assetNetwork(
        placeholder: 'image/loading.gif',
        image: category.image,
        fit: BoxFit.cover
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(category.name, style: const TextStyle(color: Colors.black),),
        ),

      ],
      ),
  );
}