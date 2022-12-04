import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/category_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/main_screen_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/payment_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/products_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/settings_controller.dart';
import 'package:ecommerce_app_with_getx/logic/theme_controller.dart';
import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Auth_Controller(),fenix: true);
    Get.lazyPut(() => MainScreen_Controller(),fenix: true);
    Get.lazyPut(() => Products_Controller(),fenix: true);
    Get.lazyPut(() => Cart_Controller(),fenix: true);
    Get.lazyPut(() => Category_Controller(),fenix: true);
    Get.lazyPut(() => Settings_Controller(),fenix: true);
    Get.lazyPut(() => Payment_Controller(),fenix: true);
    
  }
  
}