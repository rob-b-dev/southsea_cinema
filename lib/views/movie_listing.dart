import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.
import 'package:southsea_cinema/models/movie.dart'; // Movie data model.
// Widgets
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';

// Movie listing widget - shows the film selected on the home page.
// Stateful as the ticket quantity and booking message change while the page is open.
class MovieListing extends StatefulWidget {
  final Movie movie; // film passed in from the MovieCard that was tapped

  // Const constructor; calls superclass constructor.
  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  // Implements the abstract build method from State.
  @override
  // Returns a Widget; Flutter passes in context, this widget's location in the tree.
  Widget build(BuildContext context) {
    // Call Scaffold constructor and return contents to be rendered in widget tree.
    // Scaffold is a high-level widget that provides a standard layout for a page.
    return Scaffold(
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      // Scrolls the page on short screens instead of overflowing.
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          // widget.movie reads the film from the parent StatefulWidget.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.movie.title} (${widget.movie.ageRating})',
                style: cinemaHeaderStyle.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 16),
              Image.asset(
                widget.movie.posterPath,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(widget.movie.screeningTime),
              const SizedBox(height: 8),
              Text(
                widget.movie.synopsis,
                style: const TextStyle(color: AppColors.textMuted),
              ),
              const SizedBox(height: 24),
              Text('Tickets (${widget.movie.formattedPrice} each)'),
              const SizedBox(height: 12),
              DropdownMenu<int>(
                initialSelection: _ticketQuantity,
                onSelected: (int? value) {
                  if (value != null) {
                    // setState rebuilds the page with the chosen quantity.
                    setState(() {
                      _ticketQuantity = value;
                    });
                  }
                },
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: cinemaButtonStyle,
                onPressed: () {
                  setState(() {
                    _bookingMessage =
                        'Added $_ticketQuantity tickets to the order';
                  });
                },
                child: const Text('Add to order'),
              ),
              const SizedBox(height: 12),
              Text(_bookingMessage),
            ],
          ),
        ),
      ),
    );
  }
}
