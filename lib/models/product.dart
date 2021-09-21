class Product {
  final String id; // Final for now will change to a server side id later
  final String productName;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
