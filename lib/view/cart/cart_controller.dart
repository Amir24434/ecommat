import 'package:ecommat/service/product_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(ProductServices product) {
    // Check if the product's name exists in the map
    if (_products.containsKey(product.name)) {
      // Product already exists, append a new entry with quantity 1
      _products[product.name! + _products.length.toString()] = 1;
    } else {
      // Add the product to the map with quantity 1
      _products[product.name] = 1;
    }
    Get.snackbar(
      "Product Added",
      "You have added ${product.name} to cart",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }

  void removeProduct(ProductServices product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.remove(product); // Remove the product if its quantity is 1
    } else if (_products.containsKey(product) && _products[product] > 1) {
      _products[product] -=
          1; // Decrease the quantity of the product if it's greater than 1
    }
  }

  get products => _products;

  get productTotal => (productSubtotal).toString();

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);
}
