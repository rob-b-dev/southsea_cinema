import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/movie_listing_view.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

// Expected card title and ticket price for each film.
const films = [
  ('Spirited Away (PG)', '£7.50'),
  ('Back to the Future (PG)', '£6.00'),
];

void main() {
  testWidgets('Home page displays its title, movie cards and booking buttons', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.text('Southsea Cinema'), findsOneWidget);
    expect(find.byType(MovieCard), findsNWidgets(films.length));
    expect(find.text('BOOK NOW'), findsNWidgets(films.length));
    for (final (title, _) in films) {
      expect(find.text(title), findsOneWidget);
    }
  });

  // One booking test is generated per film.
  for (final (title, price) in films) {
    testWidgets('Booking $title opens its listing and adds to order', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      // BOOK NOW button inside the card showing this title.
      final bookNow = find.descendant(
        of: find.widgetWithText(MovieCard, title),
        matching: find.text('BOOK NOW'),
      );
      await tester.ensureVisible(bookNow); // Scroll it on-screen first.
      await tester.pumpAndSettle();
      await tester.tap(bookNow);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListingView), findsOneWidget);
      expect(find.text(title), findsOneWidget);
      expect(find.text('Tickets ($price each)'), findsOneWidget);

      await tester.tap(find.text('Add to order'));
      await tester.pump();
      expect(find.text('Added 1 tickets to the order'), findsOneWidget);
    });
  }
}
