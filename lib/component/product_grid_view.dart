import 'package:ecommat/component/product_item.dart';
import 'package:ecommat/const.dart';
import 'package:ecommat/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allProducts = (await RemoteService().fetchAllProducts())!;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 300,
      child: GridView.builder(
        itemCount: allProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            index: index,
            name: allProducts[index].name!,
            price: allProducts[index].price!,
            image: allProducts[index].image!,
            desc: allProducts[index].description!,
          );
        },
      ),
    );
  }
}
