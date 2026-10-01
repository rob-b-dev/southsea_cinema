import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        // Container has one child, so Column groups the film details vertically.
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Spirited Away', style: cinemaHeaderStyle),
            SizedBox(height: 8),
            Text(
              'A young girl enters a mysterious spirit world and must find a way to save her parents.',
              style: TextStyle(color: cinemaFontMuted),
            ),
            SizedBox(height: 16),
            // Row keeps the film facts together on one line.
            Row(
              children: [
                Text('Runtime: 125 min', style: TextStyle(color: cinemaFontWhite)),
                SizedBox(width: 16),
                Text('Rating: PG', style: TextStyle(color: cinemaFontWhite)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
