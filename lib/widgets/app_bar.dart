import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

// Shared app bar per screen.
// Implements PreferredSizeWidget because Scaffold's appBar slot requires it.
class CinemaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CinemaAppBar({super.key});

  // Tells Scaffold how tall the app bar is; kToolbarHeight is Flutter's standard height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Return AppBar to be placed in Scaffold's appBar slot.
    return AppBar(
      title: const Text(appTitle, style: cinemaHeaderStyle),
      backgroundColor: AppColors.surface,
      iconTheme: const IconThemeData(color: AppColors.brand),
    );
  }
}
