import 'package:dio/dio.dart';
import 'package:newapp/models/todo_model.dart';

class TodoListRepository {
  final dio = Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');
    final todosList = response.data as List;
    final todos = todosList.map((todo) => TodoModel.fromMap(todo)).toList();

    return todos;
  }
}
