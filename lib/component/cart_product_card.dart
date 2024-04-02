// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:ecommat/model/product_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'package:ecommat/theme/theme/theme/constants/colors.dart';

class CartProductCard extends StatelessWidget {
  //final ProductServices product;
  final String name;
  final String image;
  final int price;
  final int index;
  final Function() delete;
  const CartProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.index,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: OrderitColors.light,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Shimmer.fromColors(
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
                imageUrl: image,
                width: 65,
                height: 85,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 3, // Limiting to a single line
                      overflow:
                          TextOverflow.ellipsis, // Display ellipsis if overflow

                      name,
                      style: GoogleFonts.lato(
                        color: OrderitColors.greenBackground,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '#$price',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: OrderitColors.greenContainer,
                  ),
                ),
                child: GestureDetector(
                  onTap: delete,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Remove",
                        style: TextStyle(
                          color: OrderitColors.green,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
