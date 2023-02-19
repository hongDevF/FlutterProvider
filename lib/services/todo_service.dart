// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutterprovider/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<TodoModel>?> getAll() async {
    String Url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(Url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return TodoModel(
          userId: e['userId'],
          id: e['id'],
          title: e['title'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }
    return [];
  }
}
