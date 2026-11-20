import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

const movieJson = <String, dynamic>{
  'id': 'spirited-away',
  'title': 'Spirited Away',
  'synopsis': 'A young girl enters a spirit world.',
  'ageRating': 'PG',
  'screeningTime': 'Thursday 22 Oct 2026  18:00',
  'price': 7.5,
  'posterPath': 'assets/images/spirited_away.png',
};

void main() {
  group('Movie model tests', () {
    test('fromJson reads every field and toJson returns the same map', () {
      final movie = Movie.fromJson(movieJson);

      expect(movie.id, 'spirited-away');
      expect(movie.title, 'Spirited Away');
      expect(movie.synopsis, 'A young girl enters a spirit world.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Thursday 22 Oct 2026  18:00');
      expect(movie.price, 7.5);
      expect(movie.posterPath, 'assets/images/spirited_away.png');
      expect(movie.toJson(), movieJson);
    });

    test('fromJson converts a whole-number price to a double', () {
      // Spread copies movieJson, then overrides price with an int.
      final movie = Movie.fromJson({...movieJson, 'price': 6});

      expect(movie.price, isA<double>());
      expect(movie.price, 6.0);
    });
  });
}
