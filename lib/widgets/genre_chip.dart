import 'package:flutter/material.dart';
import '../theme.dart';

class GenreChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const GenreChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      showCheckmark: true,
      backgroundColor: Colors.transparent,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: selected ? AppColors.onPrimary : AppColors.onSurface,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        fontSize: 14,
      ),
      side: BorderSide(
        color: selected ? AppColors.primary : AppColors.border,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
