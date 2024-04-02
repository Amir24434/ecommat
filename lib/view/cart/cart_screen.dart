//import 'package:ecommat/controller/cart_controller.dart';
import 'package:ecommat/component/cart_product_card.dart';
import 'package:ecommat/const.dart';
import 'package:ecommat/service/cart_service.dart';
import 'package:ecommat/theme/theme/theme/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    this.image,
    this.name,
    this.price,
  });
  final String? name;
  final String? image;
  final int? price;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allCarts = (await Remote3Service().fetchCartItems());
    setState(() {
      isLoaded = true;
    });
  }

  bool isDeleting = false;

  deleteCartItem(int productId) async {
    setState(() {
      isDeleting = true;
    });
    try {
      await Remote3Service().deleteCartItem(productId);
      refreshScreen();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete item: $e'),
          backgroundColor: Colors.red,
        ),
      );
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      // After deletion (success or failure), set the state back to normal
      setState(() {
        isDeleting = false;
      });
    }
  }

  void refreshScreen() {
    // Navigate to the same screen again
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const CartScreen()), // Pass your arguments here
    );
  }

  @override
  Widget build(BuildContext context) {
    // final CartController controller = Get.put(CartController());

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            'Cart',
            style: GoogleFonts.manrope(
              color: OrderitColors.green,
            ),
          ),
          centerTitle: true,
        ),
        body: allCarts.isNotEmpty
            ? Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ListView.builder(
                    itemCount: allCarts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartProductCard(
                        delete: () {
                          deleteCartItem(index);
                        },
                        index: index,
                        name: allCarts[index].productName!,
                        price: allCarts[index].price!,
                        image: allCarts[index].image!,
                      );
                    }),
              )
            : const Center(
                child: Text(
                  "Not carts Aded yet",
                  style: TextStyle(fontSize: 16),
                ),
              ));
  }
}
