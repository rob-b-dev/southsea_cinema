// Dart extension package
import 'package:flutter/material.dart';

// Views and constants
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
// import 'package:southsea_cinema/views/movie_listing.dart';

// Application entry point
void main() {
  // Method to run dart within a flutter application
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  // Annotation
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Southsea Cinema & Arts Centre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: cinemaBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cinemaBrand,
          primary: cinemaBrand,
          surface: cinemaSurface,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        // '/listing': (context) => const MovieListing(),
      },
    );
  }
}
