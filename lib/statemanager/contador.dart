import 'package:flutter/material.dart';

class ProductCount extends StatefulWidget {
  final Function(int) onChangeCantidad;

  const ProductCount({super.key, required this.onChangeCantidad});

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> {
  
  int _cantidad = 1;

  void _aumentarCantidad() {
    setState(() {
      _cantidad++;
    });
  }

  void _disminuirCantidad() {
    setState(() {
      if (_cantidad > 1) {
        _cantidad--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _disminuirCantidad,
              child: const Text('-'),
            ),
            const SizedBox(width: 10.0),
            Text(
                '$_cantidad',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // TextButton(onPressed: cartProvider.setCantidad(_cantidad as Future<int>), child: const Text('guarda la opción')),
            const SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: _aumentarCantidad,
              child: const Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}
