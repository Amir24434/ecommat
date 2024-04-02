import 'package:ecommat/component/allproducts_demo.dart';
import 'package:ecommat/component/product_grid_view.dart';
import 'package:ecommat/const.dart';
import 'package:ecommat/theme/theme/theme/constants/colors.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
          style: TextStyle(
            color: OrderitColors.light,
          ),
        ),
        iconTheme: const IconThemeData(
          color: OrderitColors.light, // Change this color to your desired color
        ),
        backgroundColor: OrderitColors.green,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.grey[200],
          height: double.infinity,
          child: allProducts.isNotEmpty
              ? const ProductGridView()
              : const AllProductsDemo(),
        ),
      ),
    );
  }
}
