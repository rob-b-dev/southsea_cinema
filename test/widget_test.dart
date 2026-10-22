import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

const testMovie = Movie(
  id: 'spirited-away',
  title: 'Spirited Away',
  synopsis: 'A young girl enters a mysterious spirit world.',
  ageRating: 'PG',
  screeningTime: 'Thursday 22 Oct 2026  18:00',
  price: 7.50,
  posterPath: 'assets/images/spirited_away.png',
);

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Southsea Cinema'), findsOneWidget);
  });

  testWidgets('Home page displays movie cards and booking buttons', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.byType(MovieCard), findsNWidgets(2));
    expect(find.text('Spirited Away'), findsOneWidget);
    expect(find.text('Back to the Future'), findsOneWidget);
    expect(find.text('BOOK NOW'), findsNWidgets(2));
  });

  testWidgets('Booking films from the home page shows each film listing', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Two BOOK NOW buttons match, so .first selects the Spirited Away card.
    await tester.tap(find.text('BOOK NOW').first);
    await tester.pumpAndSettle();

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('Spirited Away (PG)'), findsOneWidget);
    expect(find.text('Tickets (£7.50 each)'), findsOneWidget);

    await tester.tap(find.text('Add to order'));
    await tester.pump();
    expect(find.text('Added 1 ticket to your order.'), findsOneWidget);

    // Simulate the browser/system back button to pop back to the home page.
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(MovieListing), findsNothing);

    // The second card may be below the screen, so scroll it into view first.
    await tester.ensureVisible(find.text('BOOK NOW').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('BOOK NOW').last);
    await tester.pumpAndSettle();

    expect(find.text('Back to the Future (PG)'), findsOneWidget);
    expect(find.text('Tickets (£6.00 each)'), findsOneWidget);
    expect(find.text('Added 1 ticket to your order.'), findsNothing);
  });

  testWidgets('Movie listing shows the film details and booking controls', (
    WidgetTester tester,
  ) async {
    await tester
        .pumpWidget(const MaterialApp(home: MovieListing(movie: testMovie)));

    expect(find.text('Spirited Away (PG)'), findsOneWidget);
    expect(find.text('Thursday 22 Oct 2026  18:00'), findsOneWidget);
    expect(find.byType(DropdownMenu<int>), findsOneWidget);
    expect(find.text('Add to order'), findsOneWidget);
    expect(find.text('Added 1 ticket to your order.'), findsNothing);
  });

  testWidgets('Selecting a ticket quantity updates the booking feedback', (
    WidgetTester tester,
  ) async {
    await tester
        .pumpWidget(const MaterialApp(home: MovieListing(movie: testMovie)));

    await tester.tap(find.byType(DropdownMenu<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('3 tickets').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add to order'));
    await tester.pump();

    expect(find.text('Added 3 tickets to your order.'), findsOneWidget);
  });

  testWidgets('Booking a single ticket shows singular feedback', (
    WidgetTester tester,
  ) async {
    await tester
        .pumpWidget(const MaterialApp(home: MovieListing(movie: testMovie)));

    await tester.tap(find.text('Add to order'));
    await tester.pump();

    expect(find.text('Added 1 ticket to your order.'), findsOneWidget);
  });

  testWidgets('Booking several tickets shows plural feedback', (
    WidgetTester tester,
  ) async {
    await tester
        .pumpWidget(const MaterialApp(home: MovieListing(movie: testMovie)));

    await tester.tap(find.byType(DropdownMenu<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('5 tickets').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Add to order'));
    await tester.pump();

    expect(find.text('Added 5 tickets to your order.'), findsOneWidget);
  });
}
