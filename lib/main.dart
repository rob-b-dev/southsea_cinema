import 'package:flutter/material.dart'; // Required library import for Column, Scaffold and Padding
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
// The listing page now needs a Movie passed in, so it is opened from
// MovieCard with Navigator.push instead of through a named route.
// import 'package:southsea_cinema/views/movie_listing.dart';

// Entry point of the app.
void main() {
  runApp(const SouthseaCinemaApp()); // Call constructor and pass object into runApp
}

// The root widget, which sets up the theme and the named routes - stateless as no data within it changes
/// How the app fits together:
/// 1. [HomeView] asks `MovieRepository` (the data layer) for the films.
/// 2. Each `Movie` (the model) is displayed by a `MovieCard` widget.
/// 3. Pressing "Book now" pushes `MovieListing` onto the [Navigator] stack and
///    passes the selected film through its constructor.
class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key}); // Declare constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App Config
      title: 'Southsea Cinema & Arts Centre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: cinemaBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cinemaBrand,
          primary: cinemaBrand,
          surface: cinemaSurface,
        ),
        // Shared styling for every AppBar and ElevatedButton, so screens do not repeat it.
        appBarTheme: const AppBarTheme(
          backgroundColor: cinemaSurface,
          iconTheme: IconThemeData(color: cinemaBrand),
          titleTextStyle: cinemaHeaderStyle,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: cinemaBrand,
            foregroundColor: cinemaBackground,
          ),
        ),
      ),
      initialRoute: '/',
      // Each named route maps a path to a function that builds that screen.
      routes: {
        '/': (context) => const HomeView(),
        // '/listing': (context) => const MovieListing(),
      },
    );
  }
}
