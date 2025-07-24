import 'package:flutter_test/flutter_test.dart';
import 'package:product_search_coding_interview/services/product_service.dart';

void main() {
  group('ProductService', () {
    late ProductService productService;

    setUp(() {
      productService = ProductService();
    });

    test('searchProducts returns empty list when query is empty', () {
      final results = productService.searchProducts('');
      
      expect(results.length, equals(0));
    });

    test('searchProducts filters products by name and description', () {
      final results = productService.searchProducts('premium');
      
      expect(results.length, greaterThan(0));
      expect(results.every((p) => p.name.toLowerCase().contains('premium') || p.description.toLowerCase().contains('premium')), isTrue);
    });
  });
}