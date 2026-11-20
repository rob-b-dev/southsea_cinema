import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

// Squared button: reusable widget
class CinemaButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed; // Function with no arguments and no return value.

  const CinemaButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brand,
        foregroundColor: AppColors.textPrimary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}