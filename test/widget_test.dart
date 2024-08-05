// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:news_app/main.dart';

void main() {
  testWidgets('App starts up correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the HomeScreen is displayed.
    expect(find.text('News App'), findsOneWidget);

    // Wait for the loading indicator to appear.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate the end of loading by waiting for a second.
    await tester.pumpAndSettle(Duration(seconds: 1));

    // Check for the presence of a list of news articles (which should now be displayed).
    expect(find.byType(ListView), findsOneWidget);
  });
}
