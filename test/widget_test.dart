// Basic Flutter widget test for the midsem_exam app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:midsem_exam/main.dart';

void main() {
  testWidgets('App loads with Login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Login screen is displayed
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
