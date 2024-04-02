import 'package:badges/badges.dart' as badges;
import 'package:ecommat/view/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: TextField(
                  autofocus: false,
                  onSubmitted: (val) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              height: 46,
              width: 46,
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.filter_alt_outlined,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const CartScreen());
              },
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Theme.of(context).primaryColor,
                ),
                badgeContent: const Text(
                  "1",
                  style: TextStyle(color: Colors.white),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 46,
                  width: 46,
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
