import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns at least two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, greaterThanOrEqualTo(2));
    });

    test('every movie has valid details and a unique id', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Set<String> ids = {};
      for (final Movie movie in movies) {
        expect(movie.id, isNotEmpty);
        expect(movie.title, isNotEmpty);
        expect(movie.ageRating, isNotEmpty);
        expect(movie.price, greaterThan(0));
        ids.add(movie.id);
      }

      expect(ids.length, movies.length);
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

    test('getMoviesByAgeRating returns only films with that rating', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> pgMovies = repository.getMoviesByAgeRating('PG');

      expect(pgMovies, isNotEmpty);
      for (final Movie movie in pgMovies) {
        expect(movie.ageRating, 'PG');
      }
      expect(repository.getMoviesByAgeRating('18'), isEmpty);
    });

    test('getMoviesUnderPrice returns only films cheaper than the limit', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> cheapMovies = repository.getMoviesUnderPrice(7.00);

      expect(cheapMovies, isNotEmpty);
      for (final Movie movie in cheapMovies) {
        expect(movie.price, lessThan(7.00));
      }
      expect(repository.getMoviesUnderPrice(1.00), isEmpty);
    });
  });
}
