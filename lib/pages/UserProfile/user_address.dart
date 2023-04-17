import 'package:flutter/material.dart';
import 'package:kaabhaak/providers/user_providers/user_address_provider.dart';
import 'package:provider/provider.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('Dirección de Usuario'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserAddressProvider>(
            builder: (context, userDataProvider, child) => userDataProvider
                    .isloading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                        const SizedBox(height: 30),
                        Text(
                          'Calle: ${userDataProvider.userAdress!.streetAddres}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'N. Exterior: ${userDataProvider.userAdress!.exteriorNumber}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'N. Interior: ${userDataProvider.userAdress!.interiorNumber}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Código Postal: ${userDataProvider.userAdress!.postalCode}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Ciudad: ${userDataProvider.userAdress!.town}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Estado: ${userDataProvider.userAdress!.city}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}