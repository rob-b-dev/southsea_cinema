// Movie repository - supplies film data to the views.
// Views ask the repository for films, so the data source can change later without changing the UI.

import 'package:southsea_cinema/models/movie.dart'; // Movie data model.

class MovieRepository {
  // Returns every film currently showing; mock data for now.
  List<Movie> getMovies() {
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
}
