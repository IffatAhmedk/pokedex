import 'package:flutter/material.dart';
import 'package:pokedex/views/abilities.dart';
import 'package:pokedex/views/locations.dart';
import 'package:pokedex/views/moves.dart';
import 'package:pokedex/views/items.dart';
import 'package:pokedex/views/pokedex.dart';
import 'package:pokedex/views/typeCharts.dart';
import '../theme/colorTheme.dart' as Colour;
import '../views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pokedex': (context) => Pokedex(),
        '/moves': (context) => const Moves(),
        '/abilities': (context) => const Abilities(),
        '/items': (context) => const Items(),
        '/locations': (context) => const Locations(),
        '/typeCharts': (context) => const TypeCharts()
      },
      title: 'Pokedex',
      theme: theme.copyWith(
        primaryColorLight: Colour.primaryColor,
        backgroundColor: Colour.backgroundColor,
        accentColor: Colour.activeColor,
        primaryColor: Colour.titleColor,
        hintColor: Colors.grey.shade500,
        focusColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          elevation: 0,
          foregroundColor: Color(0xFF3E403F),
          iconTheme: IconThemeData(
            color: Color(0xFF3E403F),
          ),
          color: Color(0xFFFFFFFF),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              height: 1.5,
              color: Colour.titleColor),
          headline2: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.5,
              color: Colour.titleColor),
          headline5: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.5,
              color: Colour.titleColor),
          headline6: TextStyle(
            color: Colors.white70,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
