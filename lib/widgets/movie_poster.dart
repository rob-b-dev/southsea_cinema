import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';

// A film's poster image, labelled for screen readers.
// Used by both the home screen cards and the listing page, which only differ in the size they show it at.
class MoviePoster extends StatelessWidget {
  final Movie movie;
  final double width;
  final double height;

  const MoviePoster({
    super.key,
    required this.movie,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      movie.posterPath,
      width: width,
      height: height,
      // cover fills the box without stretching the image, cropping any excess.
      fit: BoxFit.cover,
      semanticLabel: '${movie.title} poster',
    );
  }
}
