import 'dart:convert';

import 'package:ecommat/const.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

List<ProductServices> productFromJson(String str) => List<ProductServices>.from(
      jsonDecode(str).map(
        (x) => ProductServices.fromJson(x),
      ),
    );

class ProductServices {
  int? id;
  String? name;
  String? description;
  String? category;
  int? quantity;
  int? price;
  String? image;

  ProductServices(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.quantity,
      this.price,
      this.image});

  ProductServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category'] = category;
    data['quantity'] = quantity;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}

class RemoteService {
  Future<List<ProductServices>?> fetchAllProducts() async {
    final response = await http.Client().get(Uri.parse(allProductsUrl));
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    } else {
      //throw Exception('Failed to load products');
      Get.snackbar("Error", "Failed to load products");
    }
    return null;
  }
}
