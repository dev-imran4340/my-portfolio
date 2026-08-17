import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    final inter = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);
    final sora = GoogleFonts.soraTextTheme(ThemeData.dark().textTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.secondaryBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
        error: AppColors.danger,
      ),
      textTheme: inter.copyWith(
        displayLarge: sora.displayLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.4,
          height: 1.05,
        ),
        displayMedium: sora.displayMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.1,
          height: 1.1,
        ),
        headlineLarge: sora.headlineLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.8,
        ),
        headlineMedium: sora.headlineMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.6,
        ),
        headlineSmall: sora.headlineSmall?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: sora.titleLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: inter.titleMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: inter.bodyLarge?.copyWith(
          color: AppColors.textSecondary,
          height: 1.7,
          fontSize: 16,
        ),
        bodyMedium: inter.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
          height: 1.65,
        ),
        labelLarge: inter.labelLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      dividerColor: AppColors.border,
      splashFactory: InkSparkle.splashFactory,
    );
  }
}
