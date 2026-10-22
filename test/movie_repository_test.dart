import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid Spirited Away and Back to the Future', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie spiritedAway = movies[0];
      expect(spiritedAway.id, 'spirited-away');
      expect(spiritedAway.title, 'Spirited Away');
      expect(spiritedAway.price, 7.50);
      expect(spiritedAway.posterPath, isNotEmpty);

      final Movie backToTheFuture = movies[1];
      expect(backToTheFuture.id, 'back-to-the-future');
      expect(backToTheFuture.title, 'Back to the Future');
      expect(backToTheFuture.price, 6.00);
      expect(backToTheFuture.posterPath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('spirited-away');

      expect(movie, isNotNull);
      expect(movie?.title, 'Spirited Away');
      expect(movie?.price, 7.50);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
