import 'package:ecommat/component/isempty_demo_products.dart';
import 'package:ecommat/component/main_header.dart';
import 'package:ecommat/component/product_item.dart';
import 'package:ecommat/component/product_carousel.dart';
import 'package:ecommat/service/product_service.dart';
import 'package:ecommat/view/Home/all_products..dart';
import 'package:ecommat/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewer extends StatefulWidget {
  const ListViewer({super.key});

  @override
  State<ListViewer> createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
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
      child: Column(
        children: [
          const MainHeader(),
          const SizedBox(
            height: 10,
          ),
          const ProductCarousel(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              //vertical: 5,
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const AllProducts());
                  },
                  child: const Text(
                    "See more",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Visibility(
                visible: isLoaded,
                replacement: const DemoShowcase(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allProducts.length,
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
              )),
        ],
      ),
    );
  }
}
