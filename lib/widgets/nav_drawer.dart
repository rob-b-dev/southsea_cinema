import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

/// The side menu shared by every screen.
///
/// Only Home is listed. The listing page needs a specific film passed in,
/// which a menu link cannot choose, so it is opened from a movie card instead.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: cinemaBackground,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: cinemaSurface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      appTitle,
                      style: cinemaHeaderStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: cinemaBrand),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const DrawerTile(title: 'Home', route: '/'),
            // const DrawerTile(title: 'Movie Listing', route: '/listing'),
          ],
        ),
      ),
    );
  }
}

/// A menu row that closes the drawer and then opens its [route].
class DrawerTile extends StatelessWidget {
  final String title;

  /// Named route to open, or `null` for a row that only closes the drawer.
  final String? route;

  const DrawerTile({super.key, required this.title, this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: cinemaBodyStyle),
      onTap: () {
        Navigator.pop(context);
        if (route != null) {
          // Dart does not narrow a public field after a null check, so the
          // ! asserts that route has a value here.
          Navigator.pushNamed(context, route!);
        }
      },
    );
  }
}
