import 'package:flutter/cupertino.dart';
import 'package:newapp/models/todo_model.dart';
import 'package:newapp/repositories/todo_list_repository.dart';

class TodoListController extends ChangeNotifier {
  final todoListRepository = TodoListRepository();
  List<TodoModel> todos = [];

  Future<void> getAll() async {
    todos = await todoListRepository.fetchTodos();
    notifyListeners();
  }
}
