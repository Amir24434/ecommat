import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DemoShowcase extends StatelessWidget {
  const DemoShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
          children: [
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Column(children: [
                Container(
                  height: 180,
                  width: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
