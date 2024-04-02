import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ecommat/const.dart';
import 'package:get/get.dart';

List<CategoryServices> categoryFromJson(String str) =>
    List<CategoryServices>.from(
      jsonDecode(str).map(
        (x) => CategoryServices.fromJson(x),
      ),
    );

class CategoryServices {
  int? id;
  String? name;
  String? description;
  String? image;

  CategoryServices({this.id, this.name, this.description, this.image});

  CategoryServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

class Remote2Service {
  Future<List<CategoryServices>?> fetchCategoriesProducts() async {
    final response = await http.get(Uri.parse(categoriesUrl));
    if (response.statusCode == 200) {
      var json = response.body;
      return categoryFromJson(json);
    } else {
      //throw Exception('Failed to load products');
      Get.snackbar("Error", "Failed to load products");
    }
    return null;
  }
}
