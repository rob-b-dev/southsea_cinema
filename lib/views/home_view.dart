import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

// The home screen: a scrollable list of the films that are showing.
/// Data flows one way: [MovieRepository] → `List<Movie>` → one [MovieCard]
/// per film. Each card handles navigation to the booking page itself.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRepository repository = MovieRepository();
    final List<Movie> movies = repository.getMovies();

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      drawer: const NavDrawer(),
      // ListView.builder only builds the cards that are on screen, calling
      // itemBuilder once for each visible index.
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieCard(movie: movies[index]),
      ),
    );
  }
}
