import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  child: Text(
                    movie.title,
                    style: cinemaHeaderStyle.copyWith(color: cinemaBrand),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${movie.ageRating})',
                  style: const TextStyle(color: cinemaFontMuted),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movie.posterPath,
                  width: 90,
                  height: 130,
                  fit: BoxFit.cover,
                  semanticLabel: '${movie.title} poster',
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    movie.synopsis,
                    style: const TextStyle(color: cinemaFontWhite),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    movie.screeningTime,
                    style: const TextStyle(color: cinemaFontWhite),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                    foregroundColor: cinemaBackground,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieListing(movie: movie);
                        },
                      ),
                    );
                  },
                  child: const Text('Book now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
