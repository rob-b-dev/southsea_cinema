import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/basket_view.dart';
import 'package:southsea_cinema/views/settings_view.dart';

// Entry point
void main() {
  runApp(const SouthseaCinemaApp());
}

// Root widget; declare setup.
class SouthseaCinemaApp extends StatelessWidget {
  // Const constructor allows object to be created at compile time.
  const SouthseaCinemaApp({super.key});

  @override
  // Implement abstract build method;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$appTitle & Arts Centre',
      debugShowCheckedModeBanner: false,
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
