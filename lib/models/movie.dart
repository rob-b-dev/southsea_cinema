class Movie {
  final String id;
  final String title;
  final String synopsis;
  final int runtimeMinutes;
  final String ageRating;
  final String screeningTime;
  final double price;
  final String posterPath;

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
}
