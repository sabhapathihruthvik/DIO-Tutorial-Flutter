import 'package:flutter/material.dart';
import 'package:dioo/product.dart';

class DisplayProduct extends StatelessWidget {
  final Product product;
  const DisplayProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated Image with some styles
              Center(
                child: Hero(
                  tag: product.image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product.image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title Section
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Price Section
              Center(
                child: Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[700],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Description Section
              const Text(
                "Description:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // Category Section
              Row(
                children: [
                  const Icon(Icons.category, color: Colors.deepPurple),
                  const SizedBox(width: 8),
                  Text(
                    "Category: ${product.category}",
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Rating Section with Animated Gauge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Rating:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${product.rating.rate}/5",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.amber[700],
                        ),
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        product.rating.count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:dioo/product.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class DisplayProduct extends StatelessWidget {
//   final Product product;
//   const DisplayProduct({super.key, required this.product});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Text(product.title.toString()),
//             Text(product.price.toString()),
//             Text(product.description.toString()),
//             Text(product.rating.rate.toString()),
//             Text(product.rating.count.toString())
//           ],
//         ),
//       ),
//     );
//   }
// }
