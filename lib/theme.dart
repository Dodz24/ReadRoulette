import 'package:flutter/material.dart';

class AppColors {
  static const backgroundStart = Color(0xFF0D1B2A);
  static const backgroundEnd = Color(0xFF2E1A47);

  static const primary = Color(0xFF5B7FFF); 
  static const onPrimary = Color(0xFF0D1B2A); 
  static const secondary = Color(0xFF9D7BFF);
  static const surface = Color(0xFF1E2A47); 
  static const onSurface = Color(0xFFE8EEF5); 
  static const onSurfaceMuted = Color(0xFFA8B3CC); 
  static const border = Color(0xFF3D4A6B);
  static const error = Color(0xFFE5484D); 
}

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8; 
  static const double md = 16;
  static const double lg = 24;
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.error,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.backgroundStart,
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.onSurface,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.onSurface,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.onSurface,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.onSurfaceMuted,
    ),
  ),
  cardTheme: CardThemeData(
    color: AppColors.surface,
    margin: const EdgeInsets.all(AppSpacing.sm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: AppColors.border, width: 1),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.surface,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.onSurfaceMuted,
    type: BottomNavigationBarType.fixed,
  ),
);

const appBackgroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [AppColors.backgroundStart, AppColors.backgroundEnd],
);
