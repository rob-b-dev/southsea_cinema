// Movie data model - defines the shape of one film's data.

class Movie {
  // Final fields - values cannot change once a Movie is created.
  final String id; // unique key used to find a film, e.g. 'spirited-away'
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double price; // double as price holds pence as well as pounds
  final String posterPath; // must match a file in assets/images/

  // Const constructor; named parameters marked required so every value must be supplied.
  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.posterPath,
  });

  // Getter - read like a property (movie.formattedPrice); arrow syntax returns the single expression.
  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}
