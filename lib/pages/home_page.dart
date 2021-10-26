import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newapp/pages/pokedex.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pokedex()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
