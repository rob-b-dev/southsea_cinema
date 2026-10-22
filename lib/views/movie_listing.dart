import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.
import 'package:southsea_cinema/models/movie.dart'; // Movie data model.
// Widgets
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';

// Movie listing widget - shows the film selected on the home page.
// Stateful as the ticket quantity and booking feedback change while the page is open.
class MovieListing extends StatefulWidget {
  final Movie movie; // film passed in from the MovieCard that was tapped

  // Const constructor; calls superclass constructor.
  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String? _bookingFeedback;

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
            border: Border.all(color: AppColors.brandDark),
          ),
          // LayoutBuilder reports the available width so the page can
          // switch between a narrow Column and a wide Row.
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Column(children: _filmDetails())),
                    const SizedBox(width: 24),
                    Expanded(child: Column(children: _bookingSection())),
                  ],
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [..._filmDetails(), ..._bookingSection()],
              );
            },
          ),
        ),
      ),
    );
  }

  // widget.movie reads the film from the parent StatefulWidget.
  List<Widget> _filmDetails() {
    return [
      const Text(
        'Now showing',
        style: TextStyle(color: AppColors.brandLight),
      ),
      const SizedBox(height: 8),
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
      Text(
        widget.movie.screeningTime,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
      const SizedBox(height: 8),
      Text(
        widget.movie.synopsis,
        style: const TextStyle(color: AppColors.textMuted),
      ),
      const SizedBox(height: 24),
    ];
  }

  List<Widget> _bookingSection() {
    return [
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
      const SizedBox(height: 16),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brand,
          foregroundColor: AppColors.background,
        ),
        onPressed: () {
          // This demo gives feedback without creating a basket yet.
          setState(() {
            _bookingFeedback = _ticketQuantity == 1
                ? 'Added 1 ticket to your order.'
                : 'Added $_ticketQuantity tickets to your order.';
          });
        },
        child: const Text('Add to order'),
      ),
      if (_bookingFeedback != null) ...[
        const SizedBox(height: 12),
        Text(
          _bookingFeedback!,
          style: const TextStyle(color: AppColors.brandLight),
        ),
      ],
    ];
  }
}
