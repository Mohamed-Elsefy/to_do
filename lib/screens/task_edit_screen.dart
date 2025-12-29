import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/providers/task_provider.dart';
import 'package:to_do/utils/constants/app_spacing.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/ui_helper.dart/safe_padding.dart';
import 'package:to_do/widgets/app_bar_widget.dart';
import 'package:to_do/widgets/due_date_picker_widget.dart';
import 'package:to_do/widgets/priority_drop_down_widget.dart';
import 'package:to_do/widgets/tag_text_field_widget.dart';
import 'package:to_do/widgets/text_form_widget.dart';

class TaskEditScreen extends ConsumerStatefulWidget {
  final Task? task;

  const TaskEditScreen({super.key, this.task});

  @override
  ConsumerState<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends ConsumerState<TaskEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  DateTime? _dueDate;
  int _priority = 1;
  String? _tag;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.task?.description ?? '',
    );

    _dueDate = widget.task?.dueDate;
    _priority = widget.task?.priority ?? 1;
    _tag = widget.task?.tag;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(onPressed: () => _onSave()),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SafePadding.horizP(context),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // title
                    TextFormWidget(
                      lable: AppStrings.title,
                      controller: _titleController,
                    ),
                    AppSpacing.v_12,

                    // description
                    TextFormWidget(
                      lable: AppStrings.description,
                      controller: _descriptionController,
                      maxLine: 3,
                    ),
                    AppSpacing.v_12,

                    // due date
                    DueDatePickerWidget(
                      dueDate: _dueDate,
                      onDatePicked: (date) {
                        setState(() => _dueDate = date);
                      },
                    ),
                    AppSpacing.v_12,

                    // priority
                    PriorityDropDownWidget(
                      value: _priority,
                      onChanged: (value) {
                        setState(() => _priority = value);
                      },
                    ),
                    AppSpacing.v_12,

                    TagTextFieldWidget(
                      value: _tag,
                      onChanged: (value) {
                        setState(() => _tag = value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(taskListProvider.notifier);

    if (widget.task == null) {
      final newTask = Task(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        dueDate: _dueDate,
        priority: _priority,
        tag: _tag,
      );

      notifier.addTask(newTask);
    } else {
      final updatedTask = Task(
        id: widget.task!.id,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        createdAt: widget.task!.createdAt,
        dueDate: _dueDate,
        completed: widget.task!.completed,
        priority: _priority,
        tag: _tag,
      );
      notifier.updateTask(updatedTask);
    }

    Navigator.pop(context);
  }
}
