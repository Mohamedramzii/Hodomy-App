import 'package:ecommerce_app_with_getx/view/screens/cart_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/favorite_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/home_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/settings_screen.dart';
import 'package:get/state_manager.dart';

class MainScreen_Controller extends GetxController {
  RxInt currentIndex = 0.obs;

  final screenTabs = [
    Home_Screen(),
    Cart_screen(),
    Favorite_Screen(),
    Settings_Screen(),
  ].obs;

  final screenTitle = [
    "HODOMY",
    'Cart',
    'Favorites',
    'Settings',
  ].obs;
}
