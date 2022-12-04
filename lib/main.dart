
import 'package:ecommerce_app_with_getx/language/localization.dart';
import 'package:ecommerce_app_with_getx/logic/theme_controller.dart';

import 'package:ecommerce_app_with_getx/routes/routes.dart';
import 'package:ecommerce_app_with_getx/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'binding/bindings.dart';
import 'utils/constants.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  SystemUiOverlayStyle(statusBarColor: Get.isDarkMode ? darkColor : LightColor);
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      title: 'Hodomy',
      debugShowCheckedModeBanner: false,
      //original------------||
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeController().themeData,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('IsUser?') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    locale: Locale(GetStorage().read<String>('lang').toString()),
    fallbackLocale: Locale(ene),
     translations: Localization(),
      initialBinding: Binding(),
    );
  }
}
