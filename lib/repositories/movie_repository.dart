import 'package:southsea_cinema/models/movie.dart';

/// Supplies film data to the rest of the app.
///
/// This is the repository layer. Screens ask the repository for films instead
/// of creating the data themselves, so the data source can later change (for
/// example to a database or a web API) without changing any widgets.
class MovieRepository {
  /// Returns every film currently showing.
  ///
  /// The films are mock data for now. The list is `const`, so the same
  /// instance is reused on every call.
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'spirited-away',
        title: 'Spirited Away',
        synopsis:
            'A young girl enters a mysterious spirit world and must find a way to save her parents.',
        runtimeMinutes: 125,
        ageRating: 'PG',
        screeningTime: 'Thursday 22 Oct 2026, 18:00',
        price: 7.50,
        posterPath: 'assets/images/spirited_away.png',
      ),
      Movie(
        id: 'back-to-the-future',
        title: 'Back to the Future',
        synopsis:
            'Teenager Marty McFly is sent back to 1955 in a time machine and must make sure his parents fall in love.',
        runtimeMinutes: 116,
        ageRating: 'PG',
        screeningTime: 'Friday 23 Oct 2026, 20:30',
        price: 6.50,
        posterPath: 'assets/images/back_to_the_future.jpg',
      ),
    ];
  }

  /// Returns the film with the matching [id], or `null` if there is none.
  ///
  /// The `?` in `Movie?` makes the return type nullable, so Dart's null
  /// safety makes callers handle the missing case before using the result.
  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  /// Returns only the films with the given age [rating].
  List<Movie> getMoviesByAgeRating(String rating) {
    // where() keeps the items for which the function returns true, and
    // toList() turns that lazy result into a List.
    return getMovies().where((movie) => movie.ageRating == rating).toList();
  }

  /// Returns only the films whose ticket price is below [maxPrice].
  List<Movie> getMoviesUnderPrice(double maxPrice) {
    return getMovies().where((movie) => movie.price < maxPrice).toList();
  }
}
