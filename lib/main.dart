import 'package:flutter/material.dart';
import 'package:newapp/pages/home_page.dart';
import 'package:newapp/pages/todo_list_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: {'/todo-list': (context) => TodoListPage()},
  ));
}
