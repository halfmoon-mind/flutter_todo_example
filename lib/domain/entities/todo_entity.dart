import 'package:hive/hive.dart';

part 'todo_entity.g.dart';

@HiveType(typeId: 0)
class TodoEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool isCompleted;

  TodoEntity(this.id, this.title, this.isCompleted);

  TodoEntity copyWith({String? id, String? title, bool? isCompleted}) {
    return TodoEntity(
      id ?? this.id,
      title ?? this.title,
      isCompleted ?? this.isCompleted,
    );
  }
}
