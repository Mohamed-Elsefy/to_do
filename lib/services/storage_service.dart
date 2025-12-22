import 'package:to_do/models/task.dart';

abstract class StorageService {
  // get all tasks from the database
  List<Task> getAll();

  // save task to database
  Future<void> save(Task task);

  // delete task from database
  Future<void> delete(String id);

  // Listen to the changes
  Stream<List<Task>> watchAll();
}
