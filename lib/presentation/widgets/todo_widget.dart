import 'package:flutter/material.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/presentation/controllers/todo_controller.dart';
import 'package:flutter_todo_example/routes/routes.dart';
import 'package:get/get.dart';

class TodoWidget extends StatelessWidget {
  final Rx<TodoEntity> todo;
  final TodoController controller = Get.find<TodoController>();

  TodoWidget({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        leading: Checkbox(
          value: todo.value.isCompleted,
          onChanged: (value) => controller.toggleIsCompleted(todo.value),
        ),
        title: Text(todo.value.title),
        trailing: IconButton(
          onPressed: () {
            controller.textEditingController.text = todo.value.title;
            Get.toNamed(AppRoutes.editTodoPage, arguments: todo.value);
          },
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
