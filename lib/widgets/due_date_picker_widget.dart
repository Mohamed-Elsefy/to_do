import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_radius.dart';
import 'package:to_do/utils/constants/app_size.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';

class DueDatePickerWidget extends StatelessWidget {
  const DueDatePickerWidget({
    super.key,
    required this.dueDate,
    required this.onDatePicked,
  });

  final DateTime? dueDate;
  final ValueChanged<DateTime> onDatePicked;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        dueDate == null
            ? AppStrings.pickDueDate
            : '${AppStrings.due} ${dueDate!.day}/${dueDate!.month}/${dueDate!.year}',
        style: context.textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.calendar_today,
        color: AppColors.primary,
        size: AppSize.s_30,
      ),

      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: dueDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return _calendarStyle(context, child);
          },
        );

        if (picked != null) {
          onDatePicked(picked);
        }
      },
    );
  }

  Theme _calendarStyle(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.background,

          headerBackgroundColor: AppColors.primary,
          headerForegroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r_15),
          ),

          dayBackgroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return null;
          }),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            textStyle: context.textTheme.bodyMedium,
          ),
        ),
      ),
      child: child!,
    );
  }
}
