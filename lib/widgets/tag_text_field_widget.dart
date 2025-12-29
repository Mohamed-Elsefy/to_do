import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_radius.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';

class TagTextFieldWidget extends StatelessWidget {
  const TagTextFieldWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String? value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,

      style: context.textTheme.bodyMedium,
      cursorColor: AppColors.primary,

      decoration: InputDecoration(
        labelText: AppStrings.tag,
        labelStyle: context.textTheme.labelSmall,

        filled: true,
        fillColor: AppColors.background,

        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
      ),

      onChanged: onChanged,
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r_15),
      borderSide: const BorderSide(color: AppColors.primary, width: 2.5),
    );
  }
}
