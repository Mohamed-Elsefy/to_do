import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String title;
  String? description;
  DateTime createdAt;
  DateTime? dueDate;
  bool completed;
  int priority;
  String? tag;

  Task({
    String? id,
    required this.title,
    this.description,
    DateTime? createdAt,
    this.dueDate,
    this.completed = false,
    this.priority = 1,
    this.tag,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();
}
