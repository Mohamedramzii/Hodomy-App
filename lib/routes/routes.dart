import 'package:ecommerce_app_with_getx/view/screens/Auth/Login_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/Auth/forgot_password_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/Auth/signup_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/favorite_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/home_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/main_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/payment_screen.dart';
import 'package:ecommerce_app_with_getx/view/screens/settings_screen.dart';
import 'package:get/get.dart';

import '../view/screens/cart_screen.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  //initial route
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //getpages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const Welcome_Screen()),
    GetPage(name: Routes.loginScreen, page: () => Login_screen()),
    GetPage(name: Routes.signUpScreen, page: () => SignUp_Screen()),
    GetPage(
        name: Routes.forgetpasswordScreen, page: () => ForgetPassword_screen()),
    GetPage(name: Routes.homeScreen, page: () => Home_Screen()),
    GetPage(name: Routes.mainScreen, page: () => Main_screen()),
   
    GetPage(name: Routes.favoriteScreen, page: () => Favorite_Screen()),
    GetPage(name: Routes.settingsScreen, page: () => Settings_Screen()),
    GetPage(name: Routes.cartsScreen, page: () => Cart_screen()),
    GetPage(name: Routes.paymentScreen, page: () => Payment_Screen()),
    // GetPage(name: Routes.detailsScreen, page: () => Details_screen()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetpasswordScreen = '/forgetpasswordScreen';
  static const homeScreen = '/homeScreen';
  static const mainScreen = '/mainScreen';

  static const favoriteScreen = '/favoriteScreen';
  static const settingsScreen = '/settingsScreen';
  static const cartsScreen = '/cartsScreen';
  static const paymentScreen = '/paymentScreen';
  // static const detailsScreen = '/detailsScreen';
}
