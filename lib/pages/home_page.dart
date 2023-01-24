import 'package:flutter/material.dart';
import 'package:newapp/pages/pokedex.dart';
import 'package:newapp/pages/todo_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List<Widget> _pages = [
    TodoListPage(),
    Pokedex(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey[800],
        showUnselectedLabels: true,
        elevation: 5,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Lista de Tarefas',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pokedex',
            backgroundColor: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}
