import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_radius.dart';
import 'package:to_do/utils/constants/app_size.dart';
import 'package:to_do/utils/constants/app_spacing.dart';
import 'package:to_do/utils/constants/app_strings.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';
import 'package:to_do/utils/ui_helper.dart/get_formatted_date.dart';
import 'package:to_do/utils/ui_helper.dart/navigation.dart';
import 'package:to_do/utils/ui_helper.dart/safe_padding.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s_160,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: SafePadding.horizP(context)),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppRadius.r_80),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (onPressed != null)
            InkWell(
              onTap: () => Navigation.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.background,
                size: AppSize.s_30,
              ),
            ),
          AppSpacing.h_10,

          Text(
            onPressed == null
                ? '${AppStrings.today} ${getFormattedDate()}'
                : AppStrings.taskData,
            style: context.textTheme.labelLarge,
          ),
          const Spacer(),

          if (onPressed != null)
            IconButton(
              onPressed: onPressed,
              color: AppColors.background,
              iconSize: AppSize.s_30,
              icon: const Icon(Icons.save),
            ),
        ],
      ),
    );
  }
}
