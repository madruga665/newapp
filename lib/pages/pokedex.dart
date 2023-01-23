import 'package:flutter/material.dart';
import 'package:newapp/controllers/pokemon_controller.dart';

List<Color> defaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final pokemonController = PokemonController();

  getAllPokemons() async {
    await pokemonController.getAll();
  }

  @override
  void initState() {
    super.initState();
    getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: Text(
            'Pokedex',
          ),
        ),
        body: AnimatedBuilder(
          animation: pokemonController,
          builder: (context, child) {
            return pokemonController.pokemons.length > 0
                ? ListView.builder(
                    itemCount: pokemonController.pokemons.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.orangeAccent,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          leading: Container(
                            padding: const EdgeInsets.only(right: 12),
                            decoration: const BoxDecoration(
                              border: Border(
                                right:
                                    BorderSide(width: 1, color: Colors.white),
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.orange[800],
                              backgroundImage: NetworkImage(
                                pokemonController.pokemons[index].img,
                              ),
                            ),
                          ),
                          title: Text(
                              'Nome: ${pokemonController.pokemons[index].name}'),
                          subtitle: Text(
                              'Numero: ${pokemonController.pokemons[index].num}'),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
