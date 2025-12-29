import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';
import 'package:to_do/utils/constants/app_size.dart';

class PriorityIconWidget extends StatelessWidget {
  const PriorityIconWidget({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.flag,
      color: _priorityColor(value),
      size: AppSize.s_30,
    );
  }
}

Color _priorityColor(int value) {
  switch (value) {
    case 2:
      return AppColors.priorityHigh;
    case 1:
      return AppColors.priorityMedium;
    default:
      return AppColors.priorityLow;
  }
}
