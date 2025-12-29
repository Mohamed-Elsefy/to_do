import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_radius.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';
import 'package:to_do/utils/ui_helper.dart/validation.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.lable,
    required this.controller,
    this.maxLine,
  });

  final String lable;
  final TextEditingController controller;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.textTheme.labelSmall,
      cursorColor: AppColors.primary,
      maxLines: maxLine,
      validator: (lable == AppStrings.title) ? validation : null,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: context.textTheme.labelSmall,
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary, width: 2.5),
      borderRadius: BorderRadius.circular(AppRadius.r_15),
    );
  }
}
