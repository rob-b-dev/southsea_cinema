// Movie data model - defines the shape of one film's data.
class Movie {
  // Final fields - values cannot change once a Movie is created.
  final String id; // Unique key used to find a film, e.g. 'spirited-away'.
  final String title;
  final String synopsis;
  final String ageRating;
  final String screeningTime;
  final double price; // double for floating point values.
  final String posterPath; // Must match a file in assets/images/.

  const Movie({
    required this.id,
    required this.title,
    required this.synopsis,
    required this.ageRating,
    required this.screeningTime,
    required this.price,
    required this.posterPath,
  });

  // Builds a Movie from one decoded JSON object.
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      synopsis: json['synopsis'] as String,
      ageRating: json['ageRating'] as String,
      screeningTime: json['screeningTime'] as String,
      // num accepts 6 or 7.5; toDouble() makes both a double.
      price: (json['price'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'synopsis': synopsis,
        'ageRating': ageRating,
        'screeningTime': screeningTime,
        'price': price,
        'posterPath': posterPath,
      };
}
