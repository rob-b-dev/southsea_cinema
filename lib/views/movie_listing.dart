import 'package:flutter/material.dart'; // Required Flutter standard library.
// Widgets
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';

class MovieListing extends StatelessWidget {
  static const txt = ""; // Final used to prevent reassignment force const constructor compatibility.

  // Const constructor; calls superclass constructor.
  const MovieListing({super.key});

  // Implements the abstract build method from StatelessWidget.
  @override
  // Returns a Widget; Flutter passes in context, this widget's location in the tree.
  Widget build(BuildContext context) {

    // Call Scaffold constructor and return contents to be rendered in widget tree.
    // Scaffold is a high-level widget that provides a standard layout for a page.
    // Child of HomeView in the widget tree; acts as parent for the page's other widgets.
    return Scaffold(
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      body: const Column(
        children: [
          Text(
            "spirited away",
            style: TextStyle(fontSize: 30),
          ),
          Text("current showing movie $txt"),
        ],
      ),
    );
  }
}
