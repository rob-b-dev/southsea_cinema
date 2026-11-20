import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  // rootBundle needs Flutter's test binding, which plain test() doesn't start.
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loadMoviesFromAsset reads every film from the JSON file', () async {
    final movies = await MovieRepository().loadMoviesFromAsset();

    expect(movies.length, 2);
    expect(movies[0].id, 'spirited-away');
    expect(movies[0].title, 'Spirited Away');
    expect(movies[0].price, 7.5);
    expect(movies[1].id, 'back-to-the-future');
    expect(movies[1].title, 'Back to the Future');
    expect(movies[1].price, 6.0);
  });
}
