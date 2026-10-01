import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            // Container has one child, so Column groups the listing vertically.
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Spirited Away', style: cinemaHeaderStyle),
                const SizedBox(height: 8),
                const Text(
                  'A young girl enters a mysterious spirit world and must find a way to save her parents.',
                  style: TextStyle(color: cinemaFontMuted),
                ),
                const SizedBox(height: 16),
                // Row keeps the film facts together on one line.
                const Row(
                  children: [
                    Text('Runtime: 125 min', style: TextStyle(color: cinemaFontWhite)),
                    SizedBox(width: 16),
                    Text('Rating: PG', style: TextStyle(color: cinemaFontWhite)),
                  ],
                ),
                const SizedBox(height: 24),
                DropdownMenu<int>(
                  label: const Text('Tickets'),
                  initialSelection: _ticketQuantity,
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: '1 ticket'),
                    DropdownMenuEntry(value: 2, label: '2 tickets'),
                    DropdownMenuEntry(value: 3, label: '3 tickets'),
                    DropdownMenuEntry(value: 4, label: '4 tickets'),
                    DropdownMenuEntry(value: 5, label: '5 tickets'),
                  ],
                  onSelected: (int? value) {
                    if (value != null) {
                      // setState rebuilds the page with the chosen quantity.
                      setState(() => _ticketQuantity = value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
