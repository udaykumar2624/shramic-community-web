import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'theme_colors.dart';

class AppTextStyles {
  // ── Context-aware (use these in widgets) ──────────────────

  static TextStyle h1(BuildContext context) => GoogleFonts.syne(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        color: TC.textPrimary(context),
        letterSpacing: -1.5,
        height: 1.05,
      );

  static TextStyle h2(BuildContext context) => GoogleFonts.syne(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: TC.textPrimary(context),
        letterSpacing: -0.8,
      );

  static TextStyle h3(BuildContext context) => GoogleFonts.syne(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: TC.textPrimary(context),
        letterSpacing: -0.4,
      );

  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: TC.textPrimary(context),
        height: 1.7,
      );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: TC.textMuted(context),
        height: 1.65,
      );

  static TextStyle bodySmall(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: TC.textMuted(context),
        height: 1.5,
      );

  static TextStyle label(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
        letterSpacing: 1.5,
      );

  static TextStyle button(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.bg,
        letterSpacing: 0.2,
      );

  static TextStyle metricLarge(BuildContext context) => GoogleFonts.syne(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        color: AppColors.accent,
        letterSpacing: -1.0,
        height: 1.0,
      );

  static TextStyle metricMedium(BuildContext context) => GoogleFonts.syne(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.accent,
        letterSpacing: -0.5,
      );

  static TextStyle navLink(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: TC.textMuted(context),
        letterSpacing: 0.1,
      );

  static TextStyle cardTitle(BuildContext context) => GoogleFonts.syne(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: TC.textPrimary(context),
      );

  static TextStyle cardSubtitle(BuildContext context) => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: TC.textMuted(context),
      );

  // ── Static fallbacks (accent/fixed colors, no context needed) ──

  static TextStyle get labelStatic => GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
        letterSpacing: 1.5,
      );

  static TextStyle get metricMediumStatic => GoogleFonts.syne(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.accent,
        letterSpacing: -0.5,
      );

  static TextStyle get metricLargeStatic => GoogleFonts.syne(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        color: AppColors.accent,
        letterSpacing: -1.0,
        height: 1.0,
      );
}
