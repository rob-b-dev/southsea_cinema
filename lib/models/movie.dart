/// A film shown at the cinema.
///
/// This is the model layer: a plain Dart class that only holds data. It has
/// no Flutter imports, so it can be unit tested on its own.
class Movie {
  /// Unique key used to look up this film, for example `'spirited-away'`.
  final String id;
  final String title;
  final String synopsis;

  /// Length of the film in minutes.
  final int runtimeMinutes;

  /// British age rating, such as `'U'`, `'PG'`, `'12A'`, `'15'` or `'18'`.
  final String ageRating;

  /// Date and time of the screening, as display text.
  final String screeningTime;

  /// Ticket price in pounds.
  final double price;

  /// Path to the poster image registered under `assets/images/` in
  /// pubspec.yaml.
  final String posterPath;

  // Every field is final, so a Movie cannot change once it is created.
  // Named required parameters make each value explicit wherever a Movie is
  // built, and the const constructor lets fixed films be compile-time
  // constants.
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

  /// The ticket price formatted for display, for example `'£7.50'`.
  ///
  /// A getter is read like a field (`movie.formattedPrice`), and `=>` returns
  /// the single expression on its right.
  String get formattedPrice => '£${price.toStringAsFixed(2)}';

  /// Whether the film is suitable for children (rated U or PG).
  bool get isChildFriendly => ageRating == 'U' || ageRating == 'PG';

  /// Whether the film is restricted to adults (rated 18).
  bool get isAdultOnly => ageRating == '18';
}
