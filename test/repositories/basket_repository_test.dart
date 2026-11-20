import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const movie = Movie(
  id: 'test',
  title: 'Test Film',
  synopsis: 'Test synopsis.',
  ageRating: 'PG',
  screeningTime: 'Friday 20 Nov 2026  19:00',
  price: 7.50,
  posterPath: 'assets/images/test.png',
);

void main() {
  final basket = BasketRepository.instance;

  // The singleton keeps its items between tests, so empty it before each one.
  setUp(basket.clear);

  test('starts empty with a zero total', () {
    expect(basket.getItems(), isEmpty);
    expect(basket.total, 0);
  });

  test('adds items and totals their line totals', () {
    basket.addItem(const TicketItem(movie: movie, quantity: 2));
    basket.addItem(const TicketItem(movie: movie, quantity: 1));

    expect(basket.getItems().length, 2);
    expect(basket.total, 22.50);
  });

  test('removes an item by index', () {
    basket.addItem(const TicketItem(movie: movie, quantity: 1));
    basket.removeItem(0);

    expect(basket.getItems(), isEmpty);
  });

  test('clear empties the basket', () {
    basket.addItem(const TicketItem(movie: movie, quantity: 1));
    basket.clear();

    expect(basket.getItems(), isEmpty);
  });
}
