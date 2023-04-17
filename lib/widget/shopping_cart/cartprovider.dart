
import 'package:flutter/material.dart';
import 'package:kaabhaak/dto/responses/product_responses_dto.dart';

class CartProvider extends ChangeNotifier{
  final List<ProductResponseDto> _cartItems = [];
  List<ProductResponseDto> get cartItems => _cartItems;

  late int _cantidad = 0;
  

  getCantidad() => _cantidad;

  setCantidad(int cantidad) async{
    _cantidad = cantidad;
    notifyListeners();
  }

  void addProduct(BuildContext context,ProductResponseDto product, String name,) {
    if ( cartItems.any((product) => product.name == name))
    {
      ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Producto ya añadido")));
    }else{
      cartItems.add(product);
      ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Producto Agregado al carrito")));
    }
    notifyListeners();
  }

  void removeProduct(ProductResponseDto product){
    cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice => cartItems.fold(0, (previousValue, element) => previousValue + (element.price));

  // double get totalPrice => cartItems.fold(0, (previousValue, element) => previousValue + (element.price*getCantidad()));
  
  

  
}
