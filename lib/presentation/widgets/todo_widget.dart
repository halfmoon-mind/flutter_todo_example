import 'package:flutter/material.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/presentation/controllers/todo_controller.dart';
import 'package:flutter_todo_example/routes/routes.dart';
import 'package:get/get.dart';

class TodoWidget extends StatelessWidget {
  final TodoEntity todo;
  final TodoController controller = Get.find<TodoController>();

  TodoWidget({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () => controller.toggleIsCompleted(todo),
        icon: todo.isCompleted
            ? const Icon(Icons.check_box)
            : const Icon(Icons.check_box_outline_blank),
      ),
      title: Text(todo.title),
      trailing: IconButton(
        onPressed: () {
          controller.textEditingController.text = todo.title;
          Get.toNamed(AppRoutes.editTodoPage, arguments: todo);
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
