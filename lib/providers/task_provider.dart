import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/services/storage_service.dart';
import 'package:to_do/utils/app_strings.dart';

final storageServiceProvider = Provider<StorageService>(
  (ref) => throw UnimplementedError(AppStrings.storageServiceNotInit),
);

class TaskListNotifier extends StateNotifier<List<Task>> {
  final StorageService storage;

  TaskListNotifier(this.storage) : super([]) {
    _loadTasks();
  }

  void _loadTasks() {
    final tasks = storage.getAll();
    state = tasks;
  }

  // ================= CRUD =================

  Future<void> addTask(Task task) async {
    // Optimistic update
    state = [...state, task];
    await storage.save(task);
  }

  Future<void> updateTask(Task updatedTask) async {
    state = [
      for (final task in state)
        if (task.id == updatedTask.id) updatedTask else task,
    ];
    await storage.save(updatedTask);
  }

  Future<void> removeTask(String id) async {
    state = state.where((task) => task.id != id).toList();
    await storage.delete(id);
  }

  Future<void> toggleComplete(String id) async {
    final index = state.indexWhere((task) => task.id == id);
    if (index == -1) return;

    final task = state[index];

    final updatedTask = Task(
      id: task.id,
      title: task.title,
      description: task.description,
      createdAt: task.createdAt,
      dueDate: task.dueDate,
      completed: !task.completed,
      priority: task.priority,
      tag: task.tag,
    );

    await updateTask(updatedTask);
  }
}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>((
  ref,
) {
  final storage = ref.watch(storageServiceProvider);
  return TaskListNotifier(storage);
}); 
