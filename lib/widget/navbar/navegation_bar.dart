
import 'package:flutter/material.dart';
import 'package:kaabhaak/pages/principal_page/home_page.dart';
import 'package:kaabhaak/pages/principal_page/shopping_cart_page.dart';
import 'package:kaabhaak/pages/principal_page/store_page.dart';


class NavegationBar extends StatefulWidget {
  const NavegationBar({super.key});

  @override
  State<NavegationBar> createState() => _NavegationBarState();
}

class _NavegationBarState extends State<NavegationBar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.store), label: 'Tienda'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Home()
        ),
        Container(
          alignment: Alignment.center,
          child: const Store()
        ),
        Container(
          alignment: Alignment.center,
          child: const ShoppingCart()
        ),
      ][currentPageIndex],
    );
  }
}
