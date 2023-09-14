import 'package:flutter/material.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/domain/usecases/get_todos.dart';
import 'package:flutter_todo_example/domain/usecases/save_todos.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final GetTodos getTodos;
  final SaveTodos saveTodos;
  final textEditingController = TextEditingController();

  TodoController(this.getTodos, this.saveTodos);

  final todos = <TodoEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final result = await getTodos();
    todos.value = result;
    update();
  }

  void addTodo(TodoEntity todo) {
    todos.add(todo);
    saveTodos(todos);
    textEditingController.clear();
    update();
  }

  void toggleIsCompleted(TodoEntity todo) {
    final index = todos.indexWhere((element) => element.id == todo.id);
    todos[index] = todo.copyWith(isCompleted: !todo.isCompleted);
    saveTodos(todos);
    update();
  }

  void editTodo(TodoEntity todo) {
    final index = todos.indexWhere((element) => element.id == todo.id);
    todos[index] = todo;
    saveTodos(todos);
    textEditingController.clear();
    update();
  }
}
