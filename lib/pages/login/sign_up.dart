
import 'package:flutter/material.dart';
import 'package:kaabhaak/providers/user_providers/user_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final logger = Logger();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final eMailUser = TextEditingController();
  final passWordUser = TextEditingController();
  bool _passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regístrate'),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children:  <Widget> [
              Image.asset(
                    'image/beehaak.png',
                    height: 200,
                    width: 200,
                  ),
              const SizedBox(height: 20,),
              Padding(
                padding:  const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: eMailUser,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa un correo';
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
                      return 'Ingresa una contraseña';
                    }
                    return null;
                  },
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Contraseña',
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
              const SizedBox(
                height: 20,
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton.icon(onPressed: (){
                    if (formKey.currentState!.validate()) {
                      logger.d(nameController.text);
                      context.read<UserProvider>().createUser(eMailUser.text, passWordUser.text, context);
                    }
                  },
                  icon: const Icon(Icons.create), label: const Text('Crear cuenta')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
