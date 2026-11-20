import 'package:southsea_cinema/models/movie.dart';

// One basket line: a film and how many tickets for it.
class TicketItem {
  final Movie movie;
  final int quantity;

  const TicketItem({required this.movie, required this.quantity});

  double get lineTotal => movie.price * quantity;
}