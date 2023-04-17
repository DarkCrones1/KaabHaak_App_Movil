
import 'package:flutter/material.dart';
import 'package:kaabhaak/providers/user_providers/user_login_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logger = Logger();
  final eMailUser = TextEditingController();
  final passWordUser = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio de sesión',
        ),
      ),
      // backgroundColor: Colors.yellow[800],
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'image/beehaak.png',
                    height: 250,
                    width: 250,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: eMailUser,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un correo';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Correo',
                    suffixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: passWordUser,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese una contraseña';
                    }
                    return null;
                  },
                  obscureText: !_passwordVisible,
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
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('¿Olvidaste tu contraseña?'),
                      TextButton(
                        child: const Text('presiona aqui'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/recover_pass');
                        },
                      ),
                    ],
                  ),
                  FilledButton(
                    child: const Text('Entrar'),
                    onPressed: () async{
                      if (formKey.currentState!.validate()){
                        context.read<UserLoginProvider>().loginUser(eMailUser.text, passWordUser.text, context);
                      }
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton.icon(onPressed: () => Navigator.pushNamed(context, '/sign_up'), icon: const Icon(Icons.arrow_circle_right_outlined), label: const Text('Regístrate')),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
