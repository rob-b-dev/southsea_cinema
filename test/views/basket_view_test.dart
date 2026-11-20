import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

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

  setUp(basket.clear);

  testWidgets('shows empty message and no checkout when empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);
  });

  testWidgets('shows items and total, and removes an item', (
    WidgetTester tester,
  ) async {
    basket.addItem(const TicketItem(movie: movie, quantity: 2));
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('2 x Test Film - £15.00'), findsOneWidget);
    expect(find.text('Total: £15.00'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
  });

  testWidgets('checkout clears the basket and confirms', (
    WidgetTester tester,
  ) async {
    basket.addItem(const TicketItem(movie: movie, quantity: 1));
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    await tester.tap(find.text('Checkout'));
    await tester.pump();

    expect(basket.getItems(), isEmpty);
    expect(find.text('Thanks, your tickets are booked'), findsOneWidget);
  });
}
