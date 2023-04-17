
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        actions: <Widget> [
          IconButton(icon: const Icon(Icons.account_circle_outlined), onPressed: ()=> 
          Navigator.pushNamed(context, '/login_page')),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Debe de iniciar sesión antes"),
                actions: [
                  TextButton(
                    child: const Text("Cerrar"),
                    onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
              child: Container(
                width: 300,
                height: 50,
                decoration: const BoxDecoration(
                    color: Color(0xD93C1500),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    'Perfil de Usuario',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Debe de iniciar sesión antes"),
                actions: [
                  TextButton(
                    child: const Text("Cerrar"),
                    onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
              child: Container(
                width: 300,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xD93C1500),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                child: const Center(
                  child: Text('Dirección',
                  style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Debe de iniciar sesión antes"),
                actions: [
                  TextButton(
                    child: const Text("Cerrar"),
                    onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
              child: Container(
                width: 300,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xD93C1500),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                child: const Center(
                  child: Text('Elegir tema',
                  style: TextStyle(
                    fontSize: 24,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}