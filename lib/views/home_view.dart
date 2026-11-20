import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

// Home page; stateful because films load asynchronously from the JSON asset.
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Both null while loading; one is set when loading finishes.
  List<Movie>? _movies;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadMovies(); // initState can't be async, so it starts the load here.
  }

  Future<void> _loadMovies() async {
    try {
      final movies = await MovieRepository().loadMoviesFromAsset();
      // The user may have left the page during the await.
      if (!mounted) return;
      setState(() => _movies = movies);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = 'Could not load films: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Local copies let Dart promote the nullable fields after the null checks.
    final movies = _movies;
    final error = _error;

    final Widget body;
    if (error != null) {
      body = Center(child: Text(error));
    } else if (movies == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = ListView(
        children: [for (final movie in movies) MovieCard(movie: movie)],
      );
    }

    return Scaffold(
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      body: body,
    );
  }
}
