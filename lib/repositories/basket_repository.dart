import 'package:southsea_cinema/models/ticket_item.dart';

// Singleton basket shared by every screen.
class BasketRepository {
  // Private constructor; other files can't create a second basket.
  BasketRepository._internal();

  // The one shared instance, e.g. BasketRepository.instance.addItem(...).
  static final instance = BasketRepository._internal();

  final List<TicketItem> _items = [];

  // Unmodifiable copy, so only this class can change the basket.
  List<TicketItem> getItems() => List.unmodifiable(_items);

  void addItem(TicketItem item) => _items.add(item);

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }

  void clear() => _items.clear();

  double get total {
    double sum = 0;
    for (final item in _items) {
      sum += item.lineTotal;
    }
    return sum;
  }
}