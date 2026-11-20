import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

// Movie repository; supplies films from the bundled JSON asset.
class MovieRepository {
  // Reads the bundled JSON file and converts each object into a Movie.
  Future<List<Movie>> loadMoviesFromAsset() async {
    final text = await rootBundle.loadString('assets/data/movies.json');
    final jsonList = jsonDecode(text) as List<dynamic>;
    return [
      for (final item in jsonList) Movie.fromJson(item as Map<String, dynamic>),
    ];
  }
}
