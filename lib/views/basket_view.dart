import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/utils/format_price.dart';
import 'package:southsea_cinema/widgets/app_bar.dart';
import 'package:southsea_cinema/widgets/cinema_button.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

// Basket page; stateful because removing items and checking out rebuild it.
class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  final _basket = BasketRepository.instance;
  String _message = ''; // Shown after checkout.

  @override
  Widget build(BuildContext context) {
    final items = _basket.getItems();

    return Scaffold(
      appBar: const CinemaAppBar(),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            const Text('Your basket', style: cinemaHeaderStyle),
            if (items.isEmpty) const Text('Your basket is empty'),
            // indexed pairs each item with its position, needed for removeItem.
            for (final (index, item) in items.indexed)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${item.quantity} x ${item.movie.title} - '
                      '${formatPrice(item.lineTotal)}',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => setState(() => _basket.removeItem(index)),
                  ),
                ],
              ),
            // Spread (...) inserts both widgets only when the basket has items.
            if (items.isNotEmpty) ...[
              Text('Total: ${formatPrice(_basket.total)}'),
              CinemaButton(
                label: 'Checkout',
                onPressed: () => setState(() {
                  _basket.clear();
                  _message = 'Thanks, your tickets are booked';
                }),
              ),
            ],
            Text(_message, style: const TextStyle(color: AppColors.brand)),
          ],
        ),
      ),
    );
  }
}
