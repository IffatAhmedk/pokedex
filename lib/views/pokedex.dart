import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/widgets/titleWidget.dart';
import '../providers/pokemonProvider.dart';
import '../widgets/cards/bigItemCard.dart';

class Pokedex extends StatefulWidget {
  Pokedex({Key? key}) : super(key: key);

  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  List<Pokemon> pokemons = [];
  bool loading = true;

  getPokemons() async {
    pokemons = await PokemonProvider.getPokemons();
    setState(() {
      loading = false;
    });
    print(pokemons);
  }

  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBar(
            leading: Icon(
              Icons.arrow_back,
            ),
          )),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(title: "Pokedex"),
          loading
              ? Center(
                  child: SpinKitPulse(
                    color: Colors.amber,
                    size: 50.0,
                  ),
                )
              : GridView.builder(
                  controller: new ScrollController(keepScrollOffset: false),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (10 / 4),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 8,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: pokemons.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BigItemCard(
                        backgroundColor: Color(0xCCB37367),
                        label: pokemons[index].name,
                        image: pokemons[index].image,
                        onPressed: () {
                          print("Hellow");
                        });
                  }),
        ],
      )),
    );
  }
}
