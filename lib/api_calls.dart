import 'package:dio/dio.dart';
import 'package:dioo/display_product.dart';
import 'package:dioo/product.dart';
import 'package:flutter/material.dart';

class ApiCall extends StatelessWidget {
  const ApiCall({super.key});

  // Function to fetch data from the API
  Future<List<Product>> fetchAPI() async {
    Dio dio = Dio();
    final response = await dio.get('https://fakestoreapi.com/products');
    final List<dynamic> responseData = response.data;
    List<Product> products =
        responseData.map((json) => Product.fromJson(json)).toList();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchAPI(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayProduct(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            // Product Image
                            Hero(
                              tag: product.image,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  product.image,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "\$${product.price}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Right Arrow Icon
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.deepPurple,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text(
                "No data available",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}


// import 'package:dio/dio.dart';
// import 'package:dioo/display_product.dart';
// import 'package:dioo/product.dart';
// import 'package:flutter/material.dart';

// class ApiCall extends StatelessWidget {
//   const ApiCall({super.key});

//   // Function to fetch data from the API
//   Future<List<Product>> fetchAPI() async {
//     Dio dio = Dio();
//     final response = await dio.get('https://fakestoreapi.com/products');
//     final List<dynamic> responseData = response.data;
//     List<Product> products =
//         responseData.map((json) => Product.fromJson(json)).toList();
//     print(response.data.toString()); // Print the data for debugging
//     return products;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("API Call using Dio"),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: fetchAPI(),
//         builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DisplayProduct(
//                           product: snapshot.data![index],
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     child: ListTile(
//                       title: Text(snapshot.data![index].title),
//                       subtitle: Text('\$${snapshot.data![index].price}'),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Center(child: Text("No data available"));
//           }
//         },
//       ),
//     );
//   }
// }
