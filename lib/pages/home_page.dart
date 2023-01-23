import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu app de estudos Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Pokedex'),
              onPressed: () {
                Navigator.of(context).pushNamed('/pokedex');
              },
            ),
            ElevatedButton(
              child: Text('Lista de Tarefas'),
              onPressed: () {
                Navigator.of(context).pushNamed('/todo-list');
              },
            ),
          ],
        ),
      ),
    );
  }
}
