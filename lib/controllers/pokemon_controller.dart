import 'package:flutter/cupertino.dart';
import 'package:newapp/models/pokemon_model.dart';
import 'package:newapp/repositories/pokemon_repository.dart';

class PokemonController extends ChangeNotifier {
  final pokemonRepository = PokemonRepository();
  List<PokemonModel> pokemons = [];

  Future<void> getAll() async {
    pokemons = await pokemonRepository.getAll();
    notifyListeners();
  }
}
