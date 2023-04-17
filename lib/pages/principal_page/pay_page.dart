import 'package:flutter/material.dart';

class PaySelect extends StatelessWidget {
  const PaySelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago'),
      ),
      body: const Center(child: Text('Pagar')),
    );
  }
}