import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:theme_demo/main.dart';

void main() {
  // Reads the ThemeData that the Send button actually receives.
  ThemeData themeOf(WidgetTester tester) =>
      Theme.of(tester.element(find.text('Send')));

  testWidgets('starts in light mode with the indigo palette', (tester) async {
    await tester.pumpWidget(const ThemeDemoApp());

    expect(themeOf(tester).brightness, Brightness.light);
    expect(
      themeOf(tester).colorScheme.primary,
      ColorScheme.fromSeed(seedColor: Colors.indigo).primary,
    );
  });

  testWidgets('the switch moves themeMode to the dark theme', (tester) async {
    await tester.pumpWidget(const ThemeDemoApp());
    await tester.tap(find.text('Dark mode'));
    await tester.pumpAndSettle();

    expect(themeOf(tester).brightness, Brightness.dark);
  });

  testWidgets('tapping a circle reseeds the palette and moves the check', (
    tester,
  ) async {
    await tester.pumpWidget(const ThemeDemoApp());
    final teal = find.byType(CircleAvatar).at(1);
    await tester.tap(teal);
    await tester.pumpAndSettle();

    expect(
      themeOf(tester).colorScheme.primary,
      ColorScheme.fromSeed(seedColor: Colors.teal).primary,
    );
    expect(
      find.descendant(of: teal, matching: find.byIcon(Icons.check)),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
