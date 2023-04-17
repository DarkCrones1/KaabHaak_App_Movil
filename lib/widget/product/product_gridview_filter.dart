import 'package:flutter/material.dart';
import 'package:kaabhaak/dto/responses/product_responses_dto.dart';
import 'package:kaabhaak/providers/category_filtername_providers/product_category_provider.dart';
import 'package:kaabhaak/widget/shopping_cart/cartprovider.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatelessWidget {
  final String category;
  const ProductGridView({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<ProductCategoryProvider>(context);
    filterProvider.fetchProductCategory(category);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ProductCategoryProvider>(
            builder: (context, productProvider, child) =>
                productProvider.isloading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 2/3
                              ),
                          itemCount: productProvider.product?.length,
                          itemBuilder: ((context, index) => createItemCard(
                              context, productProvider.product![index])),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

createItemCard(BuildContext context, ProductResponseDto product) =>
    GestureDetector(
      onTap: () => displayAlert(context, product),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          displayImage(context, product),
          Text(
            product.name,
            style: const TextStyle(fontFamily: 'ROBOTO', fontSize: 10),
          ),
        ],
      ),
    );

displayImage(
  BuildContext context,
  ProductResponseDto product
) =>
    SizedBox(
      width: 200,
      height: 200,
      child: FadeInImage.assetNetwork(
          placeholder: 'image/loading.gif',
          image: product.image,
          fit: BoxFit.cover,
          ),
    );

displayAlert(BuildContext context, ProductResponseDto product) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Categoria: ${product.category.name}'),
              const SizedBox(
                height: 20,
              ),
              Text(product.name),
              const SizedBox(
                height: 20,
              ),
              displayImage(
                context,
                product
              ),
              const SizedBox(
                height: 20,
              ),
              Text(product.description),
              const SizedBox(
                height: 20,
              ),
              Text('Precio: ' '${product.price} pesos MXN'),
            ],
          ),
          actions: [
            ButtonBar(children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.black),
                )),
              ElevatedButton(
                onPressed: () {
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);
                  cartProvider.addProduct(context ,product, product.name);
                  Navigator.pop(context);
                },
                child: const Text('Agregar al carrito')),
              ],
            )
          ],
        )
      );
