import 'package:pokedex/graphql/client.dart';
import 'package:pokedex/model/pokemon.dart';

class PokemonProvider {
  static int offset = 0;
  static int limit = 10;

  static Future<List<Pokemon>> getPokemons() async {
    final GraphqlClient client = new GraphqlClient();
    var data;

    var variables = <String, dynamic>{"offset": offset, "limit": limit};
    try {
      var result =
          await client.query(query: POKEMON_QUERY, variables: variables);
      data = result["pokemons"]["results"];
    } catch (e) {
      print(e.toString());
    }
    return (data != null)
        ? data
            .map<Pokemon>((pokemon) => Pokemon(
                id: pokemon["id"],
                name: pokemon["name"],
                image: pokemon["image"]))
            .toList()
        : [];
  }

  static const POKEMON_QUERY = r'''query($limit: Int $offset: Int){
      pokemons(limit: $limit, offset: $offset){
        results{ name id url image artwork dreamworld }
      }
    }''';
}
