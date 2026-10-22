// Movie card: reusable widget showing one film's details and booking button.

import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.
import 'package:southsea_cinema/models/movie.dart'; // Movie data model.
import 'package:southsea_cinema/views/movie_listing.dart'; // Page opened by the booking button.

// Stateless as the card only displays the film passed into it.
class MovieCard extends StatelessWidget {
  final Movie movie; // film this card displays

  // Const constructor; movie is required so every card has a film.
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Theme's seeded colour scheme is light, so set the dark surface here.
      color: AppColors.surface,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wrap moves the age rating onto a new line if the title is too long.
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: AppColors.brand,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '(${movie.ageRating})',
                  style: const TextStyle(color: AppColors.textMuted),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Poster on the left, synopsis on the right.
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movie.posterPath,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                // Expanded constrains the text to the remaining width so it wraps instead of overflowing.
                Expanded(
                  child: Text(
                    movie.synopsis,
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Screening time on the left, booking button pushed to the right.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    movie.screeningTime,
                    style: const TextStyle(color: AppColors.textPrimary),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brand,
                    foregroundColor: AppColors.textPrimary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  // Push the listing for this card's film on top of the navigation stack.
                  // The browser back button pops it to return home.
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
                  child: const Text('BOOK NOW'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
