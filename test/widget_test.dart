import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  final Movie movie = MovieRepository().getMovies().first;

  group('Home page widget tests', () {
    testWidgets(
        'Home page shows the app title, film titles and booking buttons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.text(appTitle), findsOneWidget);
      expect(find.text('Spirited Away'), findsOneWidget);
      expect(find.text('Back to the Future'), findsOneWidget);
      expect(find.text('Book now'), findsNWidgets(2));
    });
  });

  group('Navigation widget tests', () {
    testWidgets('Tapping Book now opens the listing for that film', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Book now').last);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Back to the Future'), findsOneWidget);
      expect(find.text('Runtime: 116 min'), findsOneWidget);
      expect(find.text('Rating: PG'), findsOneWidget);
      expect(find.text('Price: £6.50'), findsOneWidget);
      expect(find.text('Spirited Away'), findsNothing);
    });

    testWidgets('Booking from the listing shows the confirmation message', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('Added 1 ticket to your order.'), findsOneWidget);
    });
  });

  group('Movie listing widget tests', () {
    testWidgets('Movie listing shows the film details and booking controls', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: MovieListing(movie: movie)));

      expect(find.text('Spirited Away'), findsOneWidget);
      expect(find.text('Runtime: 125 min'), findsOneWidget);
      expect(find.text('Rating: PG'), findsOneWidget);
      expect(find.byType(DropdownMenu<int>), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
      expect(find.text('Added 1 ticket to your order.'), findsNothing);
    });

    testWidgets('Selecting a ticket quantity updates the booking feedback', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: MovieListing(movie: movie)));

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
      await tester.pumpWidget(MaterialApp(home: MovieListing(movie: movie)));

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('Added 1 ticket to your order.'), findsOneWidget);
    });

    testWidgets('Booking several tickets shows plural feedback', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: MovieListing(movie: movie)));

      await tester.tap(find.byType(DropdownMenu<int>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('5 tickets').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('Added 5 tickets to your order.'), findsOneWidget);
    });
  });
}
