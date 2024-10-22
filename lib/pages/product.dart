

import 'package:flutter/material.dart';
import 'package:pjsk/util/utility.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            const Image(
              image: AssetImage("assets/Regalia.jpeg"),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            Expanded(
              child: Center (
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                  },
                    child: Text("Kembali"),
                )
              )
            )
          ],
        ),
      ),
      );
  }
}
class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Product 1",
      "price": "Rp 100,000",
      "sold": "10 terjual",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Product 2",
      "price": "Rp 200,000",
      "sold": "20 terjual",
      "image": "https://via.placeholder.com/150"
    },
  ];

  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Produk"),
      ),
      body: GridBuilderTwo(products: products), // Pass products to GridBuilderTwo
    );
  }
}


