import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesItem extends StatelessWidget {
  final String? image;
  final String? name;
  final int? index;

  const CategoriesItem({
    super.key,
    required this.image,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Shimmer.fromColors(
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
                    highlightColor: Colors.white,
                    baseColor: Colors.grey.shade300,
                  ),
                  fit: BoxFit.fitWidth,
                  imageUrl: image!,
                  width: 130,
                  height: 100,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Add more details as needed
            ],
          ),
        ),
      ),
    );
  }
}
