import 'package:ecommat/component/allproducts_demo.dart';
import 'package:ecommat/component/categories_grid_view.dart';
import 'package:ecommat/const.dart';
import 'package:ecommat/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allCategories = (await Remote2Service().fetchCategoriesProducts())!;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("All Categories"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.grey[200],
          height: double.infinity,
          child: allCategories.isNotEmpty
              ? const CategoriesGridView()
              : const AllProductsDemo(),
        ),
      ),
    );
  }
}
