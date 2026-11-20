import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/utils/format_price.dart';

void main() {
  test('formatPrice shows pence to two decimal places', () {
    expect(formatPrice(7.5), '£7.50');
  });

  test('formatPrice shows a whole-pound price to two decimal places', () {
    expect(formatPrice(6), '£6.00');
  });
}
