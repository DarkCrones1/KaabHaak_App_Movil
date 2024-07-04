import 'package:flutter/material.dart';
import 'package:kaabhaak/widget/carusel_widget/carrusel_image.dart';
import 'package:kaabhaak/widget/category/category_gridview.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
      ),
      // backgroundColor: Colors.yellow[800],
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CarruselImage(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Category',
                  style: TextStyle(
                    fontFamily: 'ROBOTO',
                    fontSize: 30,
                  ),
                ),
                Expanded(child: CategoryGridView())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
