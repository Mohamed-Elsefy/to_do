import 'package:to_do/models/task.dart';
import 'package:hive/hive.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  int get typeId => 0;

  @override
  Task read(BinaryReader reader) {
    final int fieldsCount = reader.readByte();
    final Map<int, dynamic> fields = {
      for (int i = 0; i < fieldsCount; i++) reader.readByte(): reader.read(),
    };

    return Task(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String?,
      createdAt: fields[3] as DateTime,
      dueDate: fields[4] as DateTime?,
      completed: fields[5] as bool,
      priority: fields[6] as int,
      tag: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.dueDate)
      ..writeByte(5)
      ..write(obj.completed)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(7)
      ..write(obj.tag);
  }
}
