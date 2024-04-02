import 'package:ecommat/component/categories_item.dart';
import 'package:ecommat/const.dart';
import 'package:flutter/material.dart';

class CategoriesGridView extends StatefulWidget {
  const CategoriesGridView({super.key});

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 300,
      child: GridView.builder(
        itemCount: allCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CategoriesItem(
            index: index,
            name: allCategories[index].name!,
            image: allCategories[index].image!,
          );
        },
      ),
    );
  }
}
