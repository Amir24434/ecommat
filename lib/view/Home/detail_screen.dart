import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommat/component/custom_button.dart';
import 'package:ecommat/service/cart_service.dart';
import 'package:ecommat/theme/theme/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.index,
    required this.desc,
    required this.image,
    required this.name,
    required this.price,
  });
  final int index;
  final String name;
  final String desc;
  final String image;
  final int price;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isAddingToCart = false;

  Future<void> clickPostButton() async {
    setState(() {
      isAddingToCart = true;
    });
    try {
      await Remote3Service().addCart(
        widget.name,
        widget.price,
        widget.image,
      );
      // After successful addition, set the button state back to normal
      setState(() {
        isAddingToCart = false;
      });
    } catch (e) {
      // Handle error if any
      print('Error: $e');
      // After error, set the button state back to normal
      setState(() {
        isAddingToCart = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(
            color: OrderitColors.light,
          ),
        ),
        iconTheme: const IconThemeData(
          color: OrderitColors.light, // Change this color to your desired color
        ),
        backgroundColor: OrderitColors.green,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
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
                        fit: BoxFit.fill,
                        imageUrl: widget.image,
                        width: MediaQuery.of(context).size.width * 0.95,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: OrderitColors.light,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            )),
                        height: 450,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: GoogleFonts.manrope(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "#${widget.price.toString()}",
                                  style: GoogleFonts.manrope(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Description",
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.desc,
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: CustomButton(
                      color: OrderitColors.greenBackground,
                      text: isAddingToCart ? "Adding to cart..." : 'Buy now',
                      textColor:
                          GoogleFonts.manrope(color: OrderitColors.light),
                      onPressed: () {
                        clickPostButton();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
