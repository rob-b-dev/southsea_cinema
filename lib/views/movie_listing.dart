import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String? _bookingFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinemaBackground,
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

  List<Widget> _filmDetails() {
    return [
      const Text(
        'Now showing',
        style: TextStyle(color: cinemaBrandLight),
      ),
      const SizedBox(height: 8),
      Text(
        widget.movie.title,
        style: cinemaHeaderStyle.copyWith(fontSize: 26),
      ),
      const SizedBox(height: 8),
      Text(
        widget.movie.synopsis,
        style: const TextStyle(color: cinemaFontMuted),
      ),
      const SizedBox(height: 16),
      // Wrap keeps the film facts together but moves to a new line if the
      // available width (such as one side of the wide layout) is too narrow.
      Wrap(
        spacing: 16,
        runSpacing: 4,
        children: [
          Text(
            'Runtime: ${widget.movie.runtimeMinutes} min',
            style: const TextStyle(color: cinemaFontWhite),
          ),
          Text(
            'Rating: ${widget.movie.ageRating}',
            style: const TextStyle(color: cinemaFontWhite),
          ),
          Text(
            'Price: ${widget.movie.formattedPrice}',
            style: const TextStyle(color: cinemaFontWhite),
          ),
        ],
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
          backgroundColor: cinemaBrand,
          foregroundColor: cinemaBackground,
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
          style: const TextStyle(color: cinemaBrandLight),
        ),
      ],
    ];
  }
}
