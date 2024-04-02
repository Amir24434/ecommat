import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommat/component/carousel_loading.dart';
import 'package:ecommat/const.dart';
import 'package:ecommat/service/category_service.dart';
import 'package:ecommat/theme/theme/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({super.key});

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  var isLoaded = false;

  var currentIndex = 0;

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
    return Column(
      children: [
        if (allCategories.isEmpty)
          const Center(child: CarouselLoading())
        else
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: CarouselSlider.builder(
                itemCount: allCategories.length,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (BuildContext context, int index, int) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CachedNetworkImage(
                      imageUrl: allCategories[index].image!,
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
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),
          ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            allCategories.length,
            (index) => Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? OrderitColors.green
                    : Colors.grey[500],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
