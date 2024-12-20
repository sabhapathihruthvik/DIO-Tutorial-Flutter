class Product {
  int id;
  String title;
  double price; // Changed from String to double
  String description;
  String category;
  String image;
  ProductRating rating;

  Product({
    required this.id,
    required this.title,
    required this.price, // Updated to double
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] ?? 0)
          .toDouble(), // Converts to double, with null safety
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: ProductRating.fromJson(json['rating']),
    );
  }
}

class ProductRating {
  double rate;
  int count;

  ProductRating({
    required this.rate,
    required this.count,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      rate: (json['rate'] ?? 0).toDouble(), // Ensures rate is double
      count: (json['count'] ?? 0).toInt(),
    );
  }
}


// class Product {
//   int id;
//   String title;
//   String price;
//   String description;
//   String category;
//   String image;
//   ProductRating rating;

//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       title: json['title'],
//       price: json['price'],
//       description: json['description'],
//       category: json['category'],
//       image: json['image'],
//       rating: ProductRating.fromJson(json['rating']),
//     );
//   }
// }

// class ProductRating {
//   double rate;
//   int count;

//   ProductRating({
//     required this.rate,
//     required this.count,
//   });

//   factory ProductRating.fromJson(Map<String, dynamic> json) {
//     return ProductRating(
//       rate: (json['rate'] ?? 0), // Handles null safety and typecasting
//       count: (json['count'] ?? 0).toInt(),
//     );
//   }
// }
