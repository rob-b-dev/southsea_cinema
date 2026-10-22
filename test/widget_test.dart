import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  testWidgets('Home page displays its title, movie cards and booking buttons', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.text('Southsea Cinema'), findsOneWidget);
    expect(find.byType(MovieCard), findsNWidgets(2));
    expect(find.text('Spirited Away (PG)'), findsOneWidget);
    expect(find.text('Back to the Future (PG)'), findsOneWidget);
    expect(find.text('BOOK NOW'), findsNWidgets(2));
  });

  testWidgets('Tapping BOOK NOW opens the film listing and adds to order', (
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
    expect(find.text('Added 1 tickets to the order'), findsOneWidget);
  });
}
