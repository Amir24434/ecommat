import 'dart:convert';

import 'package:ecommat/const.dart';
import 'package:ecommat/view/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartServices {
  int? productId;
  String? productName;
  int? price;
  String? image;

  CartServices({
    this.productId,
    this.productName,
    this.price,
    this.image,
  });

  CartServices.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    price = json['price'];
    image = json['image'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['productId'] = productId;
  //   data['productName'] = productName;
  //   data['price'] = price;
  //   data['image'] = image;
  //   return data;
  // }
}

class Remote3Service {
  List<CartServices> cartFromJson(String str) => List<CartServices>.from(
        jsonDecode(str).map((x) => CartServices.fromJson(x)),
      );

  // method to add to cart
  Future<CartServices> addCart(
      String productName, int price, String image) async {
    Map<String, dynamic> request = {
      "productName": productName,
      "price": price.toString(),
      "image": image,
    };
    final uri = Uri.parse(allCartsUrl);
    final response = await http.post(uri, body: request);

    if (response.statusCode == 201) {
      Get.to(() => const CartScreen());
      return CartServices.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load post");
    }
  }

  // Method to retrieve all cart items
  Future<List<CartServices>> fetchCartItems() async {
    final response = await http.Client().get(Uri.parse(allCartsUrl));
    if (response.statusCode == 200) {
      var json = response.body;
      return cartFromJson(json);
    } else {
      throw Exception('Failed to load cart items');
    }
  }

// Method to delete a cart item
  Future<List<CartServices>?> deleteCartItem(int productId) async {
    final uri = Uri.parse('$allCartsUrl/$productId');

    final response = await http.delete(uri);

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to delete cart item');
    }
    return null;
  }
}
