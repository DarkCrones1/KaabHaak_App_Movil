import 'package:flutter/material.dart';

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({super.key});

  @override
  State<RecoverPassPage> createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final eMailUser = TextEditingController();
  final passWordUser = TextEditingController();
  final confirmPasswordUser = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '¿Olvidaste tu contraseña?',
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  <Widget>[
                  const SizedBox(height: 30),
                  Image.asset(
                    'image/beehaak.png',
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(height: 20,),
                    Padding(
                      padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: eMailUser,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa un correo válido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: 'Correo',
                          suffixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: passWordUser,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa una contraseña valida';
                          }
                          return null;
                        },
                        obscureText: !_passwordVisible,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'contraseña',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextFormField(
                        controller: confirmPasswordUser,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa una contraseña valida';
                          }
                          return null;
                        },
                        obscureText: !_passwordVisible,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: 'Confirmar contraseña',
                          border: OutlineInputBorder(),
                          // suffixIcon: IconButton(
                          //   icon: Icon(
                          //     _passwordVisible
                          //         ? Icons.visibility
                          //         : Icons.visibility_off,
                          //     color: Theme.of(context).primaryColorDark,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       _passwordVisible = !_passwordVisible;
                          //     });
                          //   },
                          // ),
                        ),
                      ),
                    ),
                ],
              )
            ]
          ),
        ),
      )
    );
  }
}