import 'package:flutter/material.dart';
import 'package:flutter_todo_example/data/datasources/todo_local_datasource.dart';
import 'package:flutter_todo_example/data/repositories/todo_repository_impl.dart';
import 'package:flutter_todo_example/domain/entities/todo_entity.dart';
import 'package:flutter_todo_example/domain/repositories/todo_repository.dart';
import 'package:flutter_todo_example/domain/usecases/get_todos.dart';
import 'package:flutter_todo_example/domain/usecases/save_todos.dart';
import 'package:flutter_todo_example/routes/routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoEntityAdapter());
  inject();
  runApp(const MyApp());
}

void inject() {
  Get.put(TodoLocalDataSource());
  Get.put<TodoRepository>(TodoRepositoryImpl(Get.find()));
  Get.put(GetTodos(Get.find()));
  Get.put(SaveTodos(Get.find()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Todo Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.todoPage,
      getPages: AppRoutes.getPages,
    );
  }
}
