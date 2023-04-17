import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final IconData icon;
  final String ruta;
  final Color? color;
  
  const ButtonPage({
    super.key,
    required this.icon,
    required this.ruta,
    this.color,
  });

  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.pushNamed(context, ruta);
      },
      icon: Icon(icon, color: color,),
    );
  }
}

class ButtonNav extends StatelessWidget {
  final String ruta;
  final String name;
  
  const ButtonNav({
    super.key,
    required this.ruta,
    required this.name,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, ruta);
      },
      child: Text(name),
    );
  }
}

class ButtonBack extends StatelessWidget {
  final String name;
  
  const ButtonBack({
    super.key,
    required this.name,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pop(context);
      },
      child: Text(name),
    );
  }
}

class Buttonchange extends StatelessWidget {
  final String name;
  final String ruta;
  
  const Buttonchange({
    super.key,
    required this.name,
    required this.ruta,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.popAndPushNamed(context, ruta);
      },
      child: Text(name),
    );
  }
}