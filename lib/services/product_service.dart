import 'dart:math' as math;
import '../models/product.dart';

const _numberOfProducts = 2500000; // 2.5 million products

class ProductService {
  // Generate products for the search functionality
  static final List<Product> _mockProducts = _generateLargeProductDataset();
  
  static List<Product> _generateLargeProductDataset() {
    final random = math.Random(42);
    final categories = ['Electronics', 'Sports', 'Home', 'Fashion', 'Books', 'Toys'];
    final adjectives = ['Premium', 'Professional', 'Deluxe', 'Ultra', 'Smart', 'Eco-Friendly', 'Portable', 'Wireless', 'Ergonomic', 'Modern'];
    final products = ['Headphones', 'Speaker', 'Watch', 'Camera', 'Laptop', 'Phone', 'Tablet', 'Monitor', 'Keyboard', 'Mouse', 'Charger', 'Cable', 'Stand', 'Case', 'Bag'];
    
    return List.generate(_numberOfProducts, (index) {
      final adj = adjectives[random.nextInt(adjectives.length)];
      final prod = products[random.nextInt(products.length)];
      final cat = categories[random.nextInt(categories.length)];
      
      return Product(
        id: 'prod_$index',
        name: '$adj $prod ${index + 1}',
        description: 'High-quality $adj $prod with advanced features and excellent build quality. Perfect for everyday use.',
        price: (20 + random.nextDouble() * 980).toDouble(), // $20 - $1000
        category: cat,
        rating: (3 + random.nextDouble() * 2).toDouble(), // 3.0 - 5.0
        reviewCount: random.nextInt(1000),
      );
    });
  }

  List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    
    // Search through products with relevance scoring
    final results = <MapEntry<Product, double>>[];
    
    for (final product in _mockProducts) {
      final score = _calculateRelevanceScore(product, lowercaseQuery);
      if (score > 0) {
        results.add(MapEntry(product, score));
      }
    }
    
    results.sort((a, b) => b.value.compareTo(a.value));
    
    return results.map((entry) => entry.key).toList();
  }
  
  double _calculateRelevanceScore(Product product, String query) {
    double score = 0.0;
    
    final productName = product.name.toLowerCase();
    final productDescription = product.description.toLowerCase();
    final productCategory = product.category.toLowerCase();
    
    if (productName.contains(query)) {
      score += 100;
    }
    if (productCategory.contains(query)) {
      score += 80;
    }
    if (productDescription.contains(query)) {
      score += 50;
    }
    
    return score;
  }
}