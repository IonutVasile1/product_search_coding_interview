import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_search_coding_interview/models/product.dart';
import 'package:product_search_coding_interview/widgets/product_list_item.dart';

void main() {
  group('ProductListItem', () {
    late Product testProduct;

    setUp(() {
      testProduct = const Product(
        id: '1',
        name: 'Test Product',
        description: 'This is a test product description',
        price: 99.99,
        category: 'Test',
        rating: 4.5,
        reviewCount: 123,
      );
    });

    testWidgets('displays product information correctly', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductListItem(
              product: testProduct,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      // Verify product name is displayed
      expect(find.text('Test Product'), findsOneWidget);
      
      // Verify price is displayed with correct format
      expect(find.text('\$99.99'), findsOneWidget);
      
      // Verify rating is displayed
      expect(find.text(' 4.5 (123)'), findsOneWidget);
      
      // Verify tap callback works
      await tester.tap(find.byType(ListTile));
      expect(tapped, isTrue);
    });   
  });
}