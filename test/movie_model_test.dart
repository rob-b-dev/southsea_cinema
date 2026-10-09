import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

/// Builds a test film, letting each test change only the values it checks.
Movie buildMovie({String ageRating = 'PG', double price = 6.0}) {
  return Movie(
    id: 'test-film',
    title: 'Test Film',
    synopsis: 'A film used for testing.',
    runtimeMinutes: 100,
    ageRating: ageRating,
    screeningTime: 'Friday 9 Oct 2026, 19:00',
    price: price,
    posterPath: 'assets/images/spirited_away.png',
  );
}

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-film',
        title: 'Test Film',
        synopsis: 'A film used for testing.',
        runtimeMinutes: 100,
        ageRating: 'PG',
        screeningTime: 'Friday 9 Oct 2026, 19:00',
        price: 6.0,
        posterPath: 'assets/images/spirited_away.png',
      );

      expect(movie.id, 'test-film');
      expect(movie.title, 'Test Film');
      expect(movie.synopsis, 'A film used for testing.');
      expect(movie.runtimeMinutes, 100);
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Friday 9 Oct 2026, 19:00');
      expect(movie.price, 6.0);
      expect(movie.posterPath, 'assets/images/spirited_away.png');
    });

    test('formattedPrice shows a pound sign and two decimal places', () {
      expect(buildMovie(price: 6.0).formattedPrice, '£6.00');
      expect(buildMovie(price: 7.5).formattedPrice, '£7.50');
    });

    test('isChildFriendly is true only for U and PG', () {
      expect(buildMovie(ageRating: 'U').isChildFriendly, true);
      expect(buildMovie(ageRating: 'PG').isChildFriendly, true);
      expect(buildMovie(ageRating: '12A').isChildFriendly, false);
      expect(buildMovie(ageRating: '15').isChildFriendly, false);
      expect(buildMovie(ageRating: '18').isChildFriendly, false);
    });

    test('isAdultOnly is true only for 18', () {
      expect(buildMovie(ageRating: '18').isAdultOnly, true);
      expect(buildMovie(ageRating: 'U').isAdultOnly, false);
      expect(buildMovie(ageRating: 'PG').isAdultOnly, false);
      expect(buildMovie(ageRating: '15').isAdultOnly, false);
    });
  });
}
