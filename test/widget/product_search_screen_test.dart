import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_search_coding_interview/main.dart';

void main() {
  testWidgets('App starts with Product Search screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify the app shows the Product Search screen
    expect(find.text('Product Search'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Search for products'), findsOneWidget);
  });

  
  testWidgets('Search produces results for valid query', (WidgetTester tester) async {
    // TODO: write a test to verify that searching for a product produces results when a valid query is entered
    // you can use "Laptop" as a valid query
  });
}