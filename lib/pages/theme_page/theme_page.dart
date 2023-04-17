
import 'package:flutter/material.dart';
import 'package:kaabhaak/statemanager/theme/theme_mode.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige el tema preferido'),
      ),
      body: const SelectTheme(),
    );
  }
}