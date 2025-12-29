import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_size.dart';
import 'package:to_do/utils/extentions/text_theme_ext.dart';

class SpecialStateWidget extends StatelessWidget {
  const SpecialStateWidget({
    super.key,
    required this.mesg,
    required this.iconData,
  });

  final String mesg;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: AppSize.s_80, color: AppColors.primary),
        Text(
          mesg,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
