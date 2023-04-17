
import 'package:flutter/material.dart';
import 'package:kaabhaak/color_schemes.g.dart';
import 'package:kaabhaak/providers/theme_providers/change_theme_provider.dart';
import 'package:provider/provider.dart';


class SelectTheme extends StatelessWidget {
  const SelectTheme
  ({
    super.key,
  });

  @override
  Widget build(BuildContext context ){

    final theme = Provider.of<ChangeTheme>(context);


    return Column(
      children: <Widget>[
        TextButton(
          // child: const Icon(Icons.sunny),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.sunny),
              SizedBox(width: 15,),
              Text('Claro'),
            ],
          ),
          onPressed: () => theme.setTheme(ThemeData(colorScheme: lightColorScheme)),
        ),
        TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.mode_night),
              SizedBox(width: 15,),
              Text('Oscuro'),
            ],
          ),
          onPressed: () => theme.setTheme(ThemeData(colorScheme: darkColorScheme)),
        )
      ],
    );
  }
}

