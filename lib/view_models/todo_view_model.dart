// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutterprovider/models/todo_model.dart';
import 'package:flutterprovider/services/todo_service.dart';

class TodoViewModel extends ChangeNotifier {
  final _todoService = TodoService();
  bool _isLoading = false;
  List<TodoModel> _todoList = [];
  List<TodoModel> get todos => _todoList;
  Future<void> getAllTodo() async {
    _isLoading = true;
    notifyListeners();
    final response = await _todoService.getAll();
    _todoList = response!;
    _isLoading = false;
    notifyListeners();
  }
}
