import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';

void main() {
  test('TodoEntity should be created with given values', () {
    final todo = TodoEntity('1', 'Test Todo', false);

    expect(todo.id, '1');
    expect(todo.title, 'Test Todo');
    expect(todo.isCompleted, false);
  });
}
