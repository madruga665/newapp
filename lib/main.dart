import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapp/services/api.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future fetch() async {
    String url =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    final response = await http.get(Uri.parse(url));
    final decoded = jsonDecode(response.body)['pokemon'];
    final List<Pokemon> pokemons = [];

    for (var item in decoded) {
      Pokemon pokemon = Pokemon(
          id: item['id'],
          num: item['num'],
          name: item['name'],
          img: item['img']);
      pokemons.add(pokemon);
    }
    print(pokemons[24].name);
    return pokemons;
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
                    return Container(
                      child: Center(
                        child: Text('Carregando...'),
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
                                    Image.network(
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