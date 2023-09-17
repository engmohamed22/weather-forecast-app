// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forecast_app/src/modules/home/presentation/screens/home_screen.dart';

void main() {
  testWidgets('Test HomePage Widget', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify that the AppBar initially does not contain the search field.
    expect(find.byType(TextField), findsNothing);

    // Tap the search icon to show the search field.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify that the AppBar now contains the search field.
    expect(find.byType(TextField), findsOneWidget);

    // Enter text into the search field.
    await tester.enterText(find.byType(TextField), 'New York');
    await tester.pump();

    // Verify that the entered text is in the search field.
    expect(find.text('New York'), findsOneWidget);

    // Tap the clear icon to hide the search field.
    await tester.tap(find.byIcon(CupertinoIcons.clear));
    await tester.pump();

    // Verify that the AppBar no longer contains the search field.
    expect(find.byType(TextField), findsNothing);

    // You can continue testing other interactions and elements on the HomePage widget.
  });
}
