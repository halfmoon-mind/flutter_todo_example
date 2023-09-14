import 'package:flutter_todo_example/presentation/pages/edit_todo_page.dart';
import 'package:flutter_todo_example/presentation/pages/todo_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const todoPage = '/';
  static const editTodoPage = '/edit';

  static final getPages = [
    GetPage(
      name: todoPage,
      page: () => const TodoPage(),
    ),
    GetPage(
      name: editTodoPage,
      page: () => const EditTodoPage(),
    ),
  ];
}
