
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart'; // Page opened by booking button.

// Movie card: reusable widget showing one film's details and booking button.
class MovieCard extends StatelessWidget {
  final Movie movie;

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
            // Poster on the left, synopsis on the right.
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
                // Expanded constrains the text to the remaining width so it wraps instead of overflowing.
                Expanded(child: Text(movie.synopsis)),
              ],
            ),
            // Screening time on the left, booking button pushed to the right.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(movie.screeningTime),
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
                        builder: (context) => MovieListing(movie: movie),
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
