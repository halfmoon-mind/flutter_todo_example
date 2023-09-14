import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:hive/hive.dart';

class TodoLocalDataSource {
  final String _boxName = 'todos';
  Future<Box<TodoEntity>> get _todosBox async => await Hive.openBox(_boxName);

  Future<List<TodoEntity>> getTodos() async {
    final box = await _todosBox;
    return box.values.toList();
  }

  Future<void> saveTodos(List<TodoEntity> todos) async {
    final box = await _todosBox;
    for (final todo in todos) {
      await box.put(todo.id, todo);
    }
  }
}
