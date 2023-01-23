import 'package:flutter/material.dart';
import 'package:newapp/controllers/pokemon_controller.dart';
import 'package:newapp/services/api.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
        body: Container(
          color: Colors.deepOrangeAccent[200],
          child: Card(
            child: FutureBuilder(
                future: fetch(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            child: LoadingIndicator(
                              indicatorType: Indicator.lineScalePulseOut,
                              colors: defaultRainbowColors,
                              strokeWidth: 1,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return GridTile(
                              footer: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  snapshot.data[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      textBaseline: TextBaseline.alphabetic),
                                ),
                              ),
                              child: Card(
                                margin: EdgeInsets.all(10),
                                color: Colors.deepOrangeAccent[200],
                                child: Column(
                                  children: [
                                    snapshot.data[index].img == null
                                        ? Text('Carregando...')
                                        : Image.network(
                                            snapshot.data[index].img,
                                            scale: 1.8,
                                          ),
                                  ],
                                ),
                              ));
                        });
                  }
                }),
          ),
        ),
      ),
    );
  }
}


// ListView.builder(
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(snapshot.data[index].name),
//                             leading: Image.network(snapshot.data[index].img),
//                             subtitle: Text(snapshot.data[index].num),
//                           );
//                         });