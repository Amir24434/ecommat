// import 'dart:convert';

// import 'package:ecommat/const.dart';
// // import 'package:ecommat/model/ad_banner.dart';
// // import 'package:ecommat/service/remote_service/remote_banner_service.dart';
// import 'package:get/get.dart';

// import 'package:http/http.dart' as http;

// class HomeController extends GetxController {
//   static HomeController instance = Get.find();
//   // RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
//   // RxBool isBannerLoading = false.obs;
//   // var currentIndex = 0.obs;

//   var categoriesProducts = [].obs;

//   var allProducts = [].obs;

//   // @override
//   // void onInit() {
//   //   fetchAllProducts();
//   //   fetchCategoriesProducts();
//   //   super.onInit();
//   // }

//   // Future<void> fetchCategoriesProducts() async {
//   //   final response = await http.get(Uri.parse(categoriesUrl));
//   //   if (response.statusCode == 200) {
//   //     categoriesProducts.assignAll(json.decode(response.body));
//   //   } else {
//   //     //throw Exception('Failed to load products');
//   //     Get.snackbar("Error", "Failed to load products");
//   //   }
//   // }

//   // Future<void> fetchAllProducts() async {
//   //   final response = await http.Client().get(Uri.parse(allProductsUrl));
//   //   if (response.statusCode == 200) {
//   //     allProducts.assignAll(json.decode(response.body));
//   //   } else {
//   //     //throw Exception('Failed to load products');
//   //     Get.snackbar("Error", "Failed to load products");
//   //   }
//   // }

//   // @override
//   // void onInit() {
//   //   getAdBanners();
//   //   super.onInit();
//   // // }

//   // void getAdBanners() async {
//   //   try {
//   //     isBannerLoading(true);
//   //     var result = await RemoteBannerService().get();
//   //     if (result != null) {
//   //       bannerList.assignAll(
//   //         adBannerListFromJson(result.body),
//   //       );
//   //     }
//   //   } finally {
//   //     // if (kDebugMode) {
//   //     //   print(bannerList.first.image);
//   //     // }
//   //     isBannerLoading(false);
//   //   }
//   // }
// }
