import 'package:flutter/material.dart';
import 'cards/smallItemCard.dart';
import 'package:pokedex/model/menuItem.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PokemonMenuItem> menu = [
      PokemonMenuItem(
          lable: "Pokedex", color: Color(0xCC5da060), route: '/pokedex'),
      PokemonMenuItem(
          lable: "Moves", color: Color(0xCCFD746A), route: '/pokedex'),
      PokemonMenuItem(
          lable: "Abilities", color: Color(0xCC54A6F8), route: '/abilities'),
      PokemonMenuItem(
          lable: "Items", color: Color(0xCCF8D24B), route: '/pokedex'),
      PokemonMenuItem(
          lable: "Locations", color: Color(0xCC734E84), route: '/pokedex'),
      PokemonMenuItem(
          lable: "Type Charts", color: Color(0xCCB37367), route: '/pokedex')
    ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridView.builder(
              controller: new ScrollController(keepScrollOffset: false),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (10 / 4),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 8,
              ),
              scrollDirection: Axis.vertical,
              itemCount: menu.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SmallItemCard(
                    backgroundColor: menu[index].color,
                    label: menu[index].lable,
                    onPressed: () {
                      Navigator.pushNamed(context, menu[index].route);
                    });
              }),
        ),
      ),
    );
  }
}
