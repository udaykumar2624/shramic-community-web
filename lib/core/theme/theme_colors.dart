import 'package:flutter/material.dart';
import 'app_colors.dart';

class TC {
  TC._();

  static Color bg(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.bg
        : AppColors.lightBg;
  }

  static Color surface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.surface
        : AppColors.lightSurface;
  }

  static Color surface2(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.surface2
        : AppColors.lightSurface2;
  }

  static Color border(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.border
        : AppColors.lightBorder;
  }

  static Color textPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.textPrimary
        : AppColors.lightTextPrimary;
  }

  static Color textMuted(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.textMuted
        : AppColors.lightTextMuted;
  }
}
