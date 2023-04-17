import 'package:flutter/material.dart';
import 'package:kaabhaak/providers/user_providers/user_data_provider.dart';
import 'package:provider/provider.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('Perfil de Usuario'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserDataProvider>(
            builder: (context, userDataProvider, child) => userDataProvider
                    .isloading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30,),
                        CircleAvatar(
                          radius: 64,
                          backgroundImage:
                              NetworkImage(userDataProvider.userData!.image),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Nombre: ${userDataProvider.userData!.firstName} ${userDataProvider.userData!.lastName}',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Teléfono: ${userDataProvider.userData!.cellPhoneNumber}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Fecha de nacimiento: ${userDataProvider.userData!.bornDate.year}-${userDataProvider.userData!.bornDate.month}-${userDataProvider.userData!.bornDate.day}',
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
