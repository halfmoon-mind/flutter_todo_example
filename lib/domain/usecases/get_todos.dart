import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/domain/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository reposity;

  GetTodos(this.reposity);

  Future<List<TodoEntity>> call() async {
    return await reposity.getTodos();
  }
}
