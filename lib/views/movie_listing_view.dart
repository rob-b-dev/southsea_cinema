import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/utils/format_price.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';
import 'package:southsea_cinema/widgets/cinema_button.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

// Movie listing widget; displays film chosen on the home page.
class MovieListingView extends StatefulWidget {
  final Movie movie; // Film passed in from the MovieCard that was tapped.

  const MovieListingView({super.key, required this.movie});

  // Implement abstract createState() method.
  @override
  State<MovieListingView> createState() => _MovieListingViewState();
}

class _MovieListingViewState extends State<MovieListingView> {
  int _ticketQuantity = 1;
  String _bookingMessage = ''; // Shown after "Add to order"; empty until then.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      // Scrolls the page on short screens instead of overflowing.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        // widget.movie reads the film from the parent StatefulWidget.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12, // Same gap between every child.
          children: [
            Text(
              '${widget.movie.title} (${widget.movie.ageRating})',
              style: cinemaHeaderStyle,
            ),
            Image.asset(
              widget.movie.posterPath,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(widget.movie.screeningTime),
            Text(
              widget.movie.synopsis,
              style: const TextStyle(color: AppColors.textMuted),
            ),
            Text('Tickets (${formatPrice(widget.movie.price)} each)'),
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
              // Collection for; builds one entry per quantity from 1 to 5.
              dropdownMenuEntries: [
                for (var i = 1; i <= 5; i++)
                  DropdownMenuEntry(value: i, label: '$i'),
              ],
            ),
            CinemaButton(
              label: 'Add to order',
              onPressed: () {
                BasketRepository.instance.addItem(
                  TicketItem(movie: widget.movie, quantity: _ticketQuantity),
                );
                setState(() {
                  _bookingMessage =
                      'Added $_ticketQuantity tickets to the order';
                });
              },
            ),
            Text(
              _bookingMessage,
              style: const TextStyle(color: AppColors.brand),
            ),
          ],
        ),
      ),
    );
  }
}
