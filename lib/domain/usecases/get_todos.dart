import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/domain/repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<TodoEntity>> call() async {
    return await repository.getTodos();
  }
}
