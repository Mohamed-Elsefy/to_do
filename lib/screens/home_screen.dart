import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/screens/task_edit_screen.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/ui_helper.dart/navigation.dart';
import 'package:to_do/utils/ui_helper.dart/safe_padding.dart';
import 'package:to_do/widgets/special_state_widget.dart';
import 'package:to_do/widgets/task_tile_widget.dart';
import 'package:to_do/widgets/app_bar_widget.dart';
import '../providers/task_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    return Scaffold(
      floatingActionButton: const _AddTaskFAB(),

      body: Column(
        children: [
          const AppBarWidget(),
          _HomeBody(tasks: tasks, ref: ref),
        ],
      ),
    );
  }
}

class _AddTaskFAB extends StatelessWidget {
  const _AddTaskFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.background,
      shape: const CircleBorder(),

      onPressed: () {
        Navigation.push(context, const TaskEditScreen());
      },
      child: const Icon(Icons.add),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.tasks, required this.ref});

  final List<Task> tasks;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Expanded(
        child: SpecialStateWidget(
          mesg: AppStrings.noTasksYet,
          iconData: Icons.list_rounded,
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SafePadding.horizP(context)),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return TaskTileWidget(
              task: task,
              onToggleComplete: () {
                ref.read(taskListProvider.notifier).toggleComplete(task.id);
              },
              onDelete: () {
                ref.read(taskListProvider.notifier).removeTask(task.id);
              },
              onTap: () {
                Navigation.push(context, TaskEditScreen(task: task));
              },
            );
          },
        ),
      ),
    );
  }
}
