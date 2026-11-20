import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/basket_view.dart';
import 'package:southsea_cinema/views/settings_view.dart';

// Entry point - initialize app.
void main() {
  // Const satisfies the linter; no performance gain as the app runs once.
  runApp(const SouthseaCinemaApp());
}

// App root widget - declare setup -- sits at top of widget tree.
class SouthseaCinemaApp extends StatelessWidget {
  // Const constructor; allows the object to be created at compile time.
  // super calls superclass constructor.
  const SouthseaCinemaApp({super.key});

  // Implement abstract build method; @override makes Dart check the superclass has a matching method.
  @override
  // Returns a Widget; Flutter passes in context, this widget's location in the tree.
  Widget build(BuildContext context) {
    // Call MaterialApp constructor and return contents.
    return MaterialApp(
      title: '$appTitle & Arts Centre',
      debugShowCheckedModeBanner: false,
      // App-wide styling; any widget below can read it with Theme.of(context).
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          primary: AppColors.textPrimary,
          surface: AppColors.surface,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface,
          iconTheme: IconThemeData(color: AppColors.brand),
          titleTextStyle: cinemaHeaderStyle,
          elevation: 0,
        ),
      ),
      routes: {
        '/': (context) => const HomeView(),
        '/basket': (context) => const BasketView(),
        '/settings': (context) => const SettingsView(),
      },
    );
  }
}
