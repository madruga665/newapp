import 'dart:convert';

class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel(this.userId, this.id, this.title, this.completed);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['userId'] as int,
      map['id'] as int,
      map['title'] as String,
      map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
