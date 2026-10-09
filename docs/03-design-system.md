# Design System

**This document needs a visual, not just this text.** The complete visual design system is available here:

[Final Project Design System (Revised)](assets/Oliveros%20-%20Final%20Project%20Design%20System%20(Revised).pdf)

The PDF shows the palette, type scale, spacing system, reusable components, and their visual treatment in one place.

## Step A: The palette, as a ColorScheme

### Color Token Table

| Role | Hex | Used For |
|------|-----|----------|
| `primary` | `#5B7FFF` | Main buttons, active tab indicator |
| `onPrimary` | `#0D1B2A` | Text/icons on primary buttons |
| `secondary` | `#9D7BFF` | Selected chips, highlights |
| `surface` | `#1E2A47` | Cards, sheets, list items |
| `onSurface` | `#E8EEF5` | Body text, headings |
| `error` | `#E5484D` | Failed fetch, validation |

---

## Step B: The type scale, as a TextTheme

| Your Style | Flutter slot | Size | Weight | Used For |
|------------|--------------|------|--------|----------|
| Heading | `headlineSmall` | 22sp | Bold | Screen titles, result title |
| Subheading | `titleMedium` | 16sp | Semi-Bold | Section labels, tab labels |
| Body | `bodyMedium`  | 14sp | Regular | Synopsis, descriptions, chip labels |
| Caption | `labelSmall` | 12sp | Regular | Chapter count, dates, helper text |

---

## Step C: Spacing, as constants

```dart
class AppSpacing {
  static const double xs = 4;   // 4px
  static const double sm = 8;   // base unit - gap between list items
  static const double md = 16;  // gap between sections
  static const double lg = 24;  // screen edge padding
}
```

---

## Step D: Components, as files

| Component | File | Constructor Parameter | Appears On |
|-----------|------|-----------------------|------------|
| GenreChip | `lib/widgets/genre_chip.dart` | `{required String label, required bool selected, required VoidCallback onTap}` | Home/Filter Screen |
| FormatToggle | `lib/widgets/format_toggle.dart` | `{required List options, required int selectedIndex, required ValueChanged onChanged}` | Home/Filter Screen |
| PrimaryButton | `lib/widgets/primary_button.dart` | `{required String label, VoidCallback? onPressed, bool outlined = false}` | Home/Filter/Result Screen |
| ResultCard | `lib/widgets/result_card.dart` | `{required String coverUrl, required String title, required List genres, required int chapters, required String synopsis}` | Result Screen |
| ListItemCard | `lib/widgets/list_item_card.dart` | `{required String thumbnailUrl, required String title, required String year, required List genres, required VoidCallback onTap}` | Saved & History |
| BottomNavBar | `lib/widgets/bottom_navbar.dart` | `{required int activeIndex, required ValueChanged onTap}` | All Screens |
| BackArrowButton | `lib/widgets/back_arrow_button.dart` | `{required VoidCallback onPressed}` | Result Screen |

---

## Step E: The theme file, assembled (bonus)

```dart
// lib/theme.dart
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
```

---

## What changed, and why

| Element | Prelim said | Now Says | Why it Changed |
|---------|-------------|----------|----------------|
| Palette | 5 colors picked by feel; contrast checked with a calculator after the fact | Same 5 roles, now explicit ColorScheme roles (primary/onPrimary/secondary/surface/onSurface), plus an error role I hadn't defined before, and an explicit dark-only decision | Building m4a4's colorForType function showed me a hand-picked accent still needs a deliberate contrast check, not a guess made after the fact. The revision makes that check and the dark-mode decision explicit up front instead of realizing it was needed later |
| Type scale | Informal 4-size scale (22/16/14/12sp), not mapped to any Flutter API | Same 4 sizes, now mapped onto real TextTheme slots (headlineSmall, titleMedium, bodyMedium, labelSmall) and referenced by name | m4a3 taught me that hardcoding TextStyle(fontSize: ...) inline means hunting through every widget to change it later. Naming a slot once avoids that |
| Components | 7 components listed with a "Contains" description only, no file paths or parameters | Same 7 components, each now with a real file path and named constructor parameters, taking data and callbacks only | m5a5 (HAUDEX) made me actually build reusable widgets that take parameters instead of reading state directly, so I know what a real component's constructor needs to look like now, not just what it contains visually |
| Spacing | Kept | Kept 8/16/24 base scale unchanged | Nothing in m4/m5 gave me a reason to revise this, the 8px system held up across every screen I built without needing an odd in-between value |
