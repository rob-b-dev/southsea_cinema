import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/models/movie.dart'; // Movie data model.
import 'package:southsea_cinema/repositories/movie_repository.dart'; // Supplies film data.
// Widgets
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

// Home view widget - displayed under '/' route.
class HomeView extends StatelessWidget {

  // Const constructor; calls superclass constructor.
  const HomeView({super.key});

  // Implements the abstract build method from StatelessWidget.
  @override
  // Returns a Widget; Flutter passes in context, this widget's location in the tree.
  Widget build(BuildContext context) {
    // Ask the repository for the films rather than hard-coding them in the view.
    final MovieRepository repository = MovieRepository();
    final List<Movie> movies = repository.getMovies();

    // Call Scaffold constructor and return contents to be rendered in widget tree.
    // Scaffold is a high-level widget that provides a standard layout for a page.
    // Child of HomeView in the widget tree; acts as parent for the page's other widgets through nested structure.
    return Scaffold(
      
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      // ListView.builder builds cards lazily, only when they scroll into view.
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}
