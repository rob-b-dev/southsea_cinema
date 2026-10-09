import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/movie_poster.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

// The booking page for a single film.
/// It is a [StatefulWidget] because the ticket quantity and the booking
/// message change while the page is open. The film is passed in by
/// `MovieCard` when the user presses "Book now".
class MovieListing extends StatefulWidget {
  /// The film to show. The state class reads it as `widget.movie`.
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  // createState links this widget to the State object that holds the
  // changing data. Flutter keeps that object alive across rebuilds, while the
  // widget itself is recreated.
  @override
  State<MovieListing> createState() => _MovieListingState();
}

// The leading underscore makes this class private to this file.
class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;

  // Null until "Add to order" is pressed; the ? makes the type nullable.
  String? _bookingFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      drawer: const NavDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cinemaSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: cinemaBrandDark),
            ),
            // LayoutBuilder reports the available width so the page can
            // switch between a narrow Column and a wide Row.
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > wideLayoutBreakpoint) {
                  // Expanded splits the width equally between the columns.
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _filmDetails(),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _bookingSection(),
                        ),
                      ),
                    ],
                  );
                }
                // The spread operator (...) inserts both lists of widgets
                // into a single Column.
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [..._filmDetails(), ..._bookingSection()],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the title, poster and film facts for `widget.movie`.
  ///
  /// Returning a list lets the narrow and wide layouts reuse the same widgets.
  List<Widget> _filmDetails() {
    return [
      const Text(
        'Now showing',
        style: cinemaHighlightStyle,
      ),
      const SizedBox(height: 8),
      Text(
        widget.movie.title,
        style: cinemaHeaderStyle.copyWith(fontSize: 26),
      ),
      const SizedBox(height: 12),
      MoviePoster(movie: widget.movie, width: 120, height: 175),
      const SizedBox(height: 12),
      Text(
        widget.movie.screeningTime,
        style: cinemaBodyStyle,
      ),
      const SizedBox(height: 8),
      Text(
        widget.movie.synopsis,
        style: cinemaMutedStyle,
      ),
      const SizedBox(height: 16),
      // Wrap keeps the film facts together but moves to a new line if the
      // available width (such as one side of the wide layout) is too narrow.
      Wrap(
        spacing: 16,
        runSpacing: 4,
        children: [
          // A collection for adds one Text per fact, and ${...} inserts the
          // value of an expression into each string.
          for (final String fact in [
            'Runtime: ${widget.movie.runtimeMinutes} min',
            'Rating: ${widget.movie.ageRating}',
            'Price: ${widget.movie.formattedPrice}',
          ])
            Text(fact, style: cinemaBodyStyle),
        ],
      ),
      const SizedBox(height: 24),
    ];
  }

  /// Builds the ticket dropdown, the "Add to order" button and the booking
  /// message.
  List<Widget> _bookingSection() {
    return [
      // <int> is a type argument: every entry in this dropdown holds an int.
      DropdownMenu<int>(
        label: const Text('Tickets'),
        initialSelection: _ticketQuantity,
        // One entry for each quantity from 1 up to the maximum.
        dropdownMenuEntries: [
          for (int quantity = 1; quantity <= maxTicketsPerOrder; quantity++)
            DropdownMenuEntry(value: quantity, label: _ticketLabel(quantity)),
        ],
        // value is int? because nothing may be selected, so it is checked
        // before use.
        onSelected: (int? value) {
          if (value != null) {
            // setState rebuilds the page with the chosen quantity.
            setState(() => _ticketQuantity = value);
            debugPrint('Tickets: $_ticketQuantity');
          }
        },
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          // This demo gives feedback without creating a basket yet.
          setState(() {
            _bookingFeedback =
                'Added ${_ticketLabel(_ticketQuantity)} to your order.';
          });
        },
        child: const Text('Add to order'),
      ),
      // A collection if only adds the message once it exists. The ! tells
      // Dart the value is not null, which the if has just checked.
      if (_bookingFeedback != null) ...[
        const SizedBox(height: 12),
        Text(
          _bookingFeedback!,
          style: cinemaHighlightStyle,
        ),
      ],
    ];
  }
}

/// Returns the quantity with the right word, such as `'1 ticket'` or
/// `'3 tickets'`, so the dropdown and the booking message always match.
String _ticketLabel(int quantity) {
  // The conditional (? :) picks the singular or plural word.
  return quantity == 1 ? '1 ticket' : '$quantity tickets';
}
