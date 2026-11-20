import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/cinema_button.dart';

void main() {
  testWidgets('CinemaButton renders its label', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: CinemaButton(label: 'BOOK NOW', onPressed: () {})),
    );

    expect(find.text('BOOK NOW'), findsOneWidget);
  });

  testWidgets('CinemaButton calls onPressed when tapped', (
    WidgetTester tester,
  ) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: CinemaButton(
          label: 'BOOK NOW',
          onPressed: () => wasPressed = true,
        ),
      ),
    );

    await tester.tap(find.text('BOOK NOW'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
