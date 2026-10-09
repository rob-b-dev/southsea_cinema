// This is the model layer: a plain Dart class that only holds data. It has no Flutter imports, so it can be unit tested on its own.
class Movie {

  final String id;
  final String title;
  final String synopsis;

  final int runtimeMinutes;

  final String ageRating;

  final String screeningTime;

  final double price;

  // Path to the poster image registered under `assets/images/` in pubspec.yaml.
  final String posterPath;

  // Every field is final, so a Movie cannot change once it is created.
  // Named required parameters make each value explicit wherever a Movie is
  // built, and the const constructor lets fixed films be compile-time constants.
  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.runtimeMinutes,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.posterPath,
  });

  // The ticket price formatted for display, for example `'£7.50'`.
  // A getter is read like a field (`movie.formattedPrice`), and `=>` returns the single expression on its right.
  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  bool get isChildFriendly => ageRating == 'U' || ageRating == 'PG';

  bool get isAdultOnly => ageRating == '18';
}
