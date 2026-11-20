import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing_view.dart';
import 'package:southsea_cinema/widgets/cinema_button.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12, // Same gap between every child.
          children: [
            Text(
              '${movie.title} (${movie.ageRating})',
              style: const TextStyle(
                color: AppColors.brand,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Image.asset(
                  movie.posterPath,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Expanded(child: Text(movie.synopsis)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(movie.screeningTime),
                CinemaButton(
                  label: 'BOOK NOW',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieListingView(movie: movie)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
