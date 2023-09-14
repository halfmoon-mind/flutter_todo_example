import 'package:flutter/material.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/presentation/controllers/todo_controller.dart';
import 'package:get/get.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  void dispose() {
    Get.find<TodoController>().textEditingController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();
    final TodoEntity? todo = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.textEditingController,
            decoration: const InputDecoration(
              labelText: '할 일',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (todo == null) {
                controller.addTodo(
                  TodoEntity(
                    DateTime.now().millisecondsSinceEpoch.toString(),
                    controller.textEditingController.text,
                    false,
                  ),
                );
              } else {
                controller.editTodo(
                  todo.copyWith(
                    title: controller.textEditingController.text,
                  ),
                );
              }
              Get.back();
            },
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}
