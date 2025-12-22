import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/services/storage_service.dart';

class HiveStorageService implements StorageService {
  static const String _boxName = 'tasks_box';
  late Box<Task> _box;

  Future<void> init() async {
    _box = await Hive.openBox<Task>(_boxName);
  }

  // ================= CRUD =================

  @override
  List<Task> getAll() {
    return _box.values.toList();
  }

  @override
  Future<void> save(Task task) async {
    await _box.put(task.id, task);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  @override
  Stream<List<Task>> watchAll() {
    return _box.watch().map((_) => _box.values.toList());
  }
}
