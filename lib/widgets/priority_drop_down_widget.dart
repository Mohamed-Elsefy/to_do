import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_radius.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';
import 'package:to_do/widgets/priority_icon_widget.dart';

class PriorityDropDownWidget extends StatelessWidget {
  const PriorityDropDownWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      icon: PriorityIconWidget(value: value),

      dropdownColor: AppColors.background,
      style: context.textTheme.bodyMedium,

      decoration: InputDecoration(
        labelText: AppStrings.priority,
        labelStyle: context.textTheme.labelSmall,

        filled: true,
        fillColor: AppColors.background,

        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
      ),

      items: const [
        DropdownMenuItem(value: 0, child: Text(AppStrings.low)),
        DropdownMenuItem(value: 1, child: Text(AppStrings.medium)),
        DropdownMenuItem(value: 2, child: Text(AppStrings.high)),
      ],

      onChanged: (newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r_15),
      borderSide: const BorderSide(color: AppColors.primary, width: 2.5),
    );
  }
}
