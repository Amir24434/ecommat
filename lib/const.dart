import 'package:ecommat/service/cart_service.dart';
import 'package:ecommat/service/category_service.dart';
import 'package:ecommat/service/product_service.dart';

String baseUrl = "https://node-api-gijw.onrender.com";
String allProductsUrl = "https://node-api-gijw.onrender.com/api/products";
String allCartsUrl = "https://node-api-gijw.onrender.com/api/cart";
String jewelryCategoriesUrl =
    "https://fakestoreapi.com/products/category/jewelery";
String categoriesUrl = "https://node-api-gijw.onrender.com/api/categories";

List<ProductServices> allProducts = [];
List<CategoryServices> allCategories = [];
List<CartServices> allCarts = [];

class OrderitOnboardingTexts {
  // splash logo
  static const String darkAppLogo = 'asset/splashLogo.png';
  static const String lightAppLogo = 'asset/splashLogo.png';

// onboarding images
  static const String onBoardingTitle1 = 'Online Home Store and Furniture';
  static const String onBoardingTitle2 = 'Delivery Right to Your Doorstep';
  static const String onBoardingTitle3 = 'Get Support From Our Skilled Team';

  //OnboardingSubtitles

  static const String onBoardingSubtitle1 =
      "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.";

  static const String onBoardingSubtitle2 =
      "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.";

  static const String onBoardingSubtitle3 =
      "If our products don't meet your expectations, we're available 24/7 to assist you.";
}
