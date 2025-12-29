import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_radius.dart';
import 'package:to_do/utils/constants/app_spacing.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';
import 'package:to_do/widgets/priority_icon_widget.dart';

class TaskTileWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onToggleComplete;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const TaskTileWidget({
    super.key,
    required this.task,
    required this.onToggleComplete,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: AppSpacing.p_8),
          padding: const EdgeInsets.all(AppSpacing.p_10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.r_15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // checkbox
              Checkbox(
                value: task.completed,
                onChanged: (_) => onToggleComplete(),
                fillColor: WidgetStateProperty.all(Colors.white),
                side: const BorderSide(color: Colors.white),
                checkColor: AppColors.primary,
              ),

              // text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title, style: context.textTheme.titleMedium),

                    ?_buildSubtitle(context),
                  ],
                ),
              ),

              PriorityIconWidget(value: task.priority),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildSubtitle(BuildContext context) {
    if (task.dueDate == null && task.tag == null) return null;

    final parts = <String>[];

    if (task.dueDate != null) {
      parts.add(
        '${AppStrings.due} ${task.dueDate!.day}/${task.dueDate!.month}',
      );
    }

    if (task.tag != null) {
      parts.add(task.tag!);
    }

    return Text(parts.join(' • '), style: context.textTheme.titleSmall);
  }
}
