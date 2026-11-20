import 'package:southsea_cinema/models/movie.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Movie repository; supply film data to views.
class MovieRepository {
  List<Movie> getMovies() {
    // Return films.
    return const [
      Movie(
        id: 'spirited-away',
        title: 'Spirited Away',
        synopsis:
            'A young girl enters a mysterious spirit world and must find a way to save her parents.',
        ageRating: 'PG',
        screeningTime: 'Thursday 22 Oct 2026  18:00',
        price: 7.50,
        posterPath: 'assets/images/spirited_away.png',
      ),
      Movie(
        id: 'back-to-the-future',
        title: 'Back to the Future',
        synopsis:
            'Teenager Marty McFly is sent back to 1955 in a time machine and must make sure his parents fall in love.',
        ageRating: 'PG',
        screeningTime: 'Friday 23 Oct 2026  20:30',
        price: 6.00,
        posterPath: 'assets/images/back_to_the_future.jpg',
      ),
    ];
  }

  // Reads the bundled JSON file and converts each object into a Movie.
  Future<List<Movie>> loadMoviesFromAsset() async {
    final text = await rootBundle.loadString('assets/data/movies.json');
    final jsonList = jsonDecode(text) as List<dynamic>;
    return [
      for (final item in jsonList) Movie.fromJson(item as Map<String, dynamic>),
    ];
  }

  // Returns the film with the matching id, or null if none matches.
  // Movie? is nullable, so null safety makes callers handle the missing case.
  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
