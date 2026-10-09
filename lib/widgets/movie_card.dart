import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

/// A summary card for one film on the home screen.
///
/// Pressing "Book now" opens [MovieListing] for this card's [movie].
class MovieCard extends StatelessWidget {
  /// The film this card displays.
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
            // Baseline alignment lines up the title and rating text even
            // though they use different font sizes.
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                // Flexible lets a long title wrap instead of overflowing.
                Flexible(
                  child: Text(
                    movie.title,
                    style: cinemaHeaderStyle.copyWith(color: cinemaBrand),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '(${movie.ageRating})',
                  style: cinemaMutedStyle,
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
                    style: cinemaBodyStyle,
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
                    style: cinemaBodyStyle,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push adds the listing page on top of the
                    // navigation stack, passing this card's film through
                    // the MovieListing constructor.
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
