// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterprovider/view_models/todo_view_model.dart';
import 'package:flutterprovider/views/widgets/global/colors.dart';
import 'package:flutterprovider/views/widgets/global/custom_text.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<TodoViewModel>(context, listen: false).getAllTodo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CO_GRAY,
      appBar: AppBar(
        backgroundColor: CO_BLUE,
        title: Text(
          "TOTO",
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        color: Colors.amberAccent,
        onRefresh: () async {},
        child: Consumer<TodoViewModel>(builder: (context, value, child) {
          final todos = value.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Card(
                color: todo.completed == true ? Colors.green.shade700 : CO_GRAY,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: CO_DEEPPINK,
                    child: CustomText(
                      text: todo.id.toString(),
                    ),
                  ),
                  title: CustomText(
                    text: todo.title!,
                    textSize: 15,
                    color: todo.completed == true ? CO_WHITE : CO_RED,
                  ),
                  trailing: Text(
                    todo.completed.toString(),
                    style: TextStyle(
                      color: todo.completed == true ? CO_BLUE : CO_RED,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
