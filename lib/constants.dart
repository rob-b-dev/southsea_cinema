// Global reusable constants
// Type annotation unecessary as Dart infers type at compile time.

import 'package:flutter/material.dart'; // Required Flutter standard library.

const appTitle = 'Southsea Cinema';

const cinemaHeaderStyle = TextStyle(
  color: AppColors.textPrimary,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

// App colour palette. Placed under class for readability, organisation and scalability.
// abstract - class cannot be initialised; final - class cannot be extended.
abstract final class AppColors {
  // Brand
  static const brand = Color(0xFF55BEDE); // primary brand colour

  // Surfaces
  static const background = Color(0xFF1B1E28); // screen background
  static const surface = Color(0xFF242936); // cards and panels

  // Text
  static const textPrimary = Color(0xFFFFFFFF); // main text
  static const textMuted = Color(0xFF8A90A0); // secondary text
}
