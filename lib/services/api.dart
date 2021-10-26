import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newapp/models/pokemon.dart';

Future fetch() async {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  final response = await http.get(Uri.parse(url));
  final decoded = jsonDecode(response.body)['pokemon'];
  final result = decoded
      .map((data) => Pokemon(
          id: data['id'],
          name: data['name'],
          num: data['num'],
          img: data['img']))
      .toList();
  print(result[0]);
  return result;
}



// Outra forma de fazer o fetch
// Future fetch() async {
//   String url =
//       "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
//   final response = await http.get(Uri.parse(url));
//   final decoded = jsonDecode(response.body)['pokemon'];
//   final List<Pokemon> pokemons = [];

//   for (var item in decoded) {
//     Pokemon pokemon = Pokemon(
//         id: item['id'],
//         num: item['num'],
//         name: item['name'],
//         img: item['img']);
//     pokemons.add(pokemon);
//   }
//   return pokemons;
// }