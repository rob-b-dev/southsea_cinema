// Shared app bar: defined once and reused by every screen's Scaffold on import.

import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.

// Shared app bar used by every screen.
// Implements PreferredSizeWidget because Scaffold's appBar slot requires it.
class CinemaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CinemaAppBar({super.key});

  // Tells Scaffold how tall the app bar is; kToolbarHeight is Flutter's standard height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Return appbar to be wrapped in Scaffold.
    return AppBar(
      title: const Text(appTitle, style: cinemaHeaderStyle),
      backgroundColor: AppColors.surface,
      iconTheme: const IconThemeData(color: AppColors.brand),
      elevation: 0,
    );
  }
}