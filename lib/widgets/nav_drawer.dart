import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.

// Side menu shared by every screen.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: AppColors.surface,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      appTitle,
                      style: cinemaHeaderStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.brand),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const DrawerTile(title: 'Home', route: '/'),
          ],
        ),
      ),
    );
  }
}

// One menu item; opens the named route when tapped.
class DrawerTile extends StatelessWidget {
  final String title;
  final String route;

  const DrawerTile({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: AppColors.textPrimary)),
      onTap: () {
        Navigator.pop(context); // Close the drawer first.
        Navigator.pushNamed(context, route);
      },
    );
  }
}
