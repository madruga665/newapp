import 'package:dio/dio.dart';
import 'package:newapp/models/pokemon_model.dart';

class PokemonRepository {
  final dio = Dio();

  Future<List<PokemonModel>> getAll() async {
    final response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final pokemonList = response.data as List;
    final pokemons =
        pokemonList.map((todo) => PokemonModel.fromMap(todo)).toList();

    return pokemons;
  }
}
