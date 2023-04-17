
import 'package:flutter/material.dart';
import 'package:kaabhaak/widget/shopping_cart/cartprovider.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final cantidadController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final itemCart = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: itemCart.length,
        itemBuilder: (context, index) {
          final product = itemCart[index];
          return ListTile(
            title: Text(product.name),
            // subtitle: passCantidad(),
            leading: FadeInImage.assetNetwork(placeholder: 'images/loading.gif', image: product.image),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => cartProvider.removeProduct(product),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Total: \$${cartProvider.totalPrice}', style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),
            // ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/page_pay'), child: const Text('Pagar'))
          ],
        ),
      ),
    );
  }
}