import 'package:flutter/material.dart';

// Design tokens shared by every screen, so the brand values only need
// changing in one place. Being const, they are fixed at compile time.

/// Name shown in the app bar and the navigation drawer.
const String appTitle = 'Southsea Cinema';

// Brand blues used for buttons, icons and highlights.
const Color cinemaBrand = Color(0xFF55BEDE);
const Color cinemaBrandLight = Color(0xFF7FCEE6);
const Color cinemaBrandDark = Color(0xFF3FB5D9);

// Background, surface and text colours for the dark theme.
const Color cinemaBackground = Color(0xFF1B1E28);
const Color cinemaFontWhite = Color(0xFFFFFFFF);
const Color cinemaFontMuted = Color(0xFF8A90A0);
const Color cinemaSurface = Color(0xFF242936);

/// Width in logical pixels above which the movie listing shows the film
/// details and booking section side by side instead of stacked.
const double wideLayoutBreakpoint = 600;

/// Bold white style used for app bar titles and film titles.
const TextStyle cinemaHeaderStyle = TextStyle(
  color: cinemaFontWhite,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
