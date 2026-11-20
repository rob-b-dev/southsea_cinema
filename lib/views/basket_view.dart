import 'package:flutter/material.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CinemaAppBar(),
      drawer: NavDrawer(),
      body: Center(child: Text('Basket')),
    );
  }
}
