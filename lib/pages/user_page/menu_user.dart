import 'package:flutter/material.dart';
import 'package:kaabhaak/providers/user_providers/user_login_provider.dart';

class MenuUser extends StatelessWidget {
  const MenuUser({super.key});

  @override
  Widget build(BuildContext context) {
    UserLoginProvider? loginProvider;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        actions: [
          TextButton(
            child: const Text('Cerrar Sesión'),
            onPressed: () {
              Navigator.restorablePushNamedAndRemoveUntil(context, '/home_navbar', (route) => false);
              loginProvider!.clearAuthToken();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/userData_page'),
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
              onTap: () => Navigator.pushNamed(context, '/userAddress_page'),
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
              onTap: () => Navigator.pushNamed(context, '/theme_page'),
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
                  child: Text('Seleccionar Tema',
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
