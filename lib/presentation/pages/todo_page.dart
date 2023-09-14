import 'package:flutter/material.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/domain/usecases/get_todos.dart';
import 'package:flutter_todo_example/domain/usecases/save_todos.dart';
import 'package:flutter_todo_example/presentation/controllers/todo_controller.dart';
import 'package:flutter_todo_example/presentation/pages/edit_todo_page.dart';
import 'package:flutter_todo_example/presentation/widgets/todo_widget.dart';
import 'package:get/get.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: TodoController(Get.find<GetTodos>(), Get.find<SaveTodos>()),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Todo'),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Todo', icon: Icon(Icons.list)),
                    Tab(text: 'Done', icon: Icon(Icons.check)),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.textEditingController.clear();
                      Get.to(() => const EditTodoPage());
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              body: TabBarView(children: [
                Obx(() {
                  final inProgressTodos =
                      controller.todos.where((t) => !t.isCompleted).toList();
                  return _buildTodoList(inProgressTodos);
                }),
                Obx(() {
                  final completedTodos =
                      controller.todos.where((t) => t.isCompleted).toList();
                  return _buildTodoList(completedTodos);
                })
              ]),
            ),
          );
        });
  }

  Widget _buildTodoList(List<TodoEntity> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index].obs;
        return TodoWidget(todo: todo, key: Key(todo.value.id));
      },
    );
  }
}
