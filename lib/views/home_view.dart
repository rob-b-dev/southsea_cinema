import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

// Home view widget.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ask repository for films rather than hard-coding them in the view.
    final MovieRepository repository = MovieRepository();
    final List<Movie> movies = repository.getMovies();

    // Call Scaffold constructor and return contents.
    // Scaffold gives the screen its standard layout: app bar, drawer and body slots.
    return Scaffold(
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      // ListView.builder; named constructor that builds cards lazily as they scroll into view.
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}