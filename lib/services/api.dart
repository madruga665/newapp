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
  return result;
}
