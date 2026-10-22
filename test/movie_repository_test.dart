import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    final MovieRepository repository = MovieRepository();

    test('getMovies returns two movies', () {
      expect(repository.getMovies().length, 2);
    });

    test('getMovies contains valid Spirited Away and Back to the Future', () {
      final List<Movie> movies = repository.getMovies();

      expect(movies[0].id, 'spirited-away');
      expect(movies[0].title, 'Spirited Away');
      expect(movies[0].price, 7.50);
      expect(movies[0].posterPath, isNotEmpty);

      expect(movies[1].id, 'back-to-the-future');
      expect(movies[1].title, 'Back to the Future');
      expect(movies[1].price, 6.00);
      expect(movies[1].posterPath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final Movie? movie = repository.getMovieById('spirited-away');

      expect(movie, isNotNull);
      expect(movie?.title, 'Spirited Away');
    });

    test('getMovieById returns null when id does not exist', () {
      expect(repository.getMovieById('non-existent'), isNull);
    });
  });
}
