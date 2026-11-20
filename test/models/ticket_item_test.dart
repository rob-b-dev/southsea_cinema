import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';

void main() {
  test('lineTotal multiplies price by quantity', () {
    const movie = Movie(
      id: 'test',
      title: 'Test Film',
      synopsis: 'Test synopsis.',
      ageRating: 'PG',
      screeningTime: 'Friday 20 Nov 2026  19:00',
      price: 7.50,
      posterPath: 'assets/images/test.png',
    );
    const item = TicketItem(movie: movie, quantity: 3);

    expect(item.lineTotal, 22.50);
  });
}
