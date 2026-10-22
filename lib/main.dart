import 'package:flutter/material.dart'; // Required Flutter standard library.
import 'package:southsea_cinema/constants.dart'; // Global constants for config.
// Views
import 'package:southsea_cinema/views/home_view.dart';

// Entry point - initialize app.
void main() {
  runApp(const SouthseaCinemaApp()); // compile-time constant to satisfy linter works same without as app runs once.
}

// App root widget - declare config -- sits at top of widget tree.
class SouthseaCinemaApp extends StatelessWidget {

  // Const constructor; calls superclass constructor.
  // Linting encourages const constructor implementation as super.key uses final modifier.
  const SouthseaCinemaApp({super.key});

  // Implements the abstract build method from StatelessWidget.
  @override
  // Returns a Widget; Flutter passes in context, this widget's location in the tree.
  Widget build(BuildContext context) {
    // Call MaterialApp constructor and return contents to be rendered in widget tree.
    /// MaterialApp is a high-level widget that implements material design setup for everything beneath it,
    /// sitting below its parent SouthseaCinemaApp in the widget tree. 
    return MaterialApp(
      title: '$appTitle & Arts Centre',
      debugShowCheckedModeBanner: false,
      // Theme instance that 'Theme.of(context)' points to, a plan data class defining global theme config.
      // Copywith returns new identical object except for fields passed to this method.
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          primary: AppColors.textPrimary,
          surface: AppColors.surface,
        ),
      ),
    
      initialRoute: '/', // Route on app start.
      // Routes per view.
      routes: {
        // compile-time instances improve performance; views compiled once and reused.
        '/': (context) => const HomeView(),
      },
    );
  }
}
