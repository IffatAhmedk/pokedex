import 'package:flutter/material.dart';

class PokemonMenuItem {
  late String lable;
  late Color color;
  String? image;
  List<String> tags = [];
  late String route;

  PokemonMenuItem(
      {required this.lable,
      required this.color,
      this.image,
      tags,
      required this.route});
}
