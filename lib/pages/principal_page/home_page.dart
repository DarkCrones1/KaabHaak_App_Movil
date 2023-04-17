import 'package:flutter/material.dart';
import 'package:kaabhaak/pages/search_page/search_product_page.dart';
import 'package:kaabhaak/widget/button_custom/button_navegation.dart';
import 'package:kaabhaak/widget/product/product_gridview.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final search = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenid@'),
        actions: const [
          ButtonPage(
            icon: Icons.menu,
            ruta: '/menu_page',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            'kaab Haak',
            style: TextStyle(
              fontSize: 50,
              fontFamily: 'ROBOTO',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formkey,
            child: SizedBox(
              width: 350,
              height: 40,
              child: TextFormField(
                controller: search,
                decoration: InputDecoration(
                  filled: false,
                  suffixIcon: IconButton(
                      onPressed: () async{
                        // context.read<SearchProvider>().fetchProductFilter(search.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchProductPage(nameSearch: search.text,)));
                      },
                      icon: const Icon(Icons.search)),
                  labelText: 'Búsqueda',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: ProductGridView())
        ],
      ),
    );
  }
}
