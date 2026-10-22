import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'spirited-away',
        title: 'Spirited Away',
        synopsis: 'A young girl enters a mysterious spirit world.',
        ageRating: 'PG',
        screeningTime: 'Thursday 22 Oct 2026  18:00',
        price: 7.50,
        posterPath: 'assets/images/spirited_away.png',
      );

      expect(movie.id, 'spirited-away');
      expect(movie.title, 'Spirited Away');
      expect(movie.synopsis, 'A young girl enters a mysterious spirit world.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Thursday 22 Oct 2026  18:00');
      expect(movie.price, 7.50);
      expect(movie.posterPath, 'assets/images/spirited_away.png');
    });

    test('formattedPrice shows a whole-pound price with two decimal places', () {
      const movie = Movie(
        id: 'test',
        title: 'Test Film',
        synopsis: 'Test synopsis',
        ageRating: 'U',
        screeningTime: 'Monday 26 Oct 2026  12:00',
        price: 6,
        posterPath: 'assets/images/spirited_away.png',
      );

      expect(movie.formattedPrice, '£6.00');
    });

    test('formattedPrice shows a price with pence to two decimal places', () {
      const movie = Movie(
        id: 'test',
        title: 'Test Film',
        synopsis: 'Test synopsis',
        ageRating: 'U',
        screeningTime: 'Monday 26 Oct 2026  12:00',
        price: 7.5,
        posterPath: 'assets/images/spirited_away.png',
      );

      expect(movie.formattedPrice, '£7.50');
    });
  });
}
