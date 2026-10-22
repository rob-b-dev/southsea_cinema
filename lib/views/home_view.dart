import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.
// Widgets
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';

// Home view widget - displayed under '/' route.
class HomeView extends StatelessWidget {

  // Const constructor; calls superclass constructor.
  const HomeView({super.key});

  // Implements the abstract build method from StatelessWidget.
  @override
  // Returns a Widget; Flutter passes in context, this widget's location in the tree.
  Widget build(BuildContext context) {

    // Call Scaffold constructor and return contents to be rendered in widget tree.
    // Scaffold is a high-level widget that provides a standard layout for a page.
    // Child of HomeView in the widget tree; acts as parent for the page's other widgets through nested structure.
    return Scaffold(
      
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      // Named parameter of Scaffold and 
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to $appTitle',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
