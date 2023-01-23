import 'package:dio/dio.dart';
import 'package:newapp/models/pokemon_model.dart';

class PokemonRepository {
  final dio = Dio();

  Future<List<PokemonModel>> getAll() async {
    final response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    final data = PokemonResponse.fromJson(response.data);

    return data.pokemon;
  }
}
