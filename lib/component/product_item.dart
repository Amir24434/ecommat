import 'package:ecommat/view/Home/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  final String? name;
  final String? desc;
  final String? image;
  final int? price;
  final int index;

  const ProductItem({
    super.key,
    required this.index,
    required this.desc,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailScreen(
                index: index,
                desc: desc!,
                image: image!,
                name: name!,
                price: price!,
              ));
        },
        child: Container(
          color: Colors.white,
          width: 150,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display your product information here
                Center(
                  child: CachedNetworkImage(
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    fit: BoxFit.fitWidth,
                    imageUrl: image!,
                    width: 130,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    maxLines: 2, // Limiting to a single line
                    overflow:
                        TextOverflow.ellipsis, // Display ellipsis if overflow

                    name!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Price: #$price',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                // Add more details as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
