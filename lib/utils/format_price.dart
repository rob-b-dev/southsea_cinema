// Formats an amount in pounds to two decimal places, e.g. £6.00.
String formatPrice(double amount) => '£${amount.toStringAsFixed(2)}';
