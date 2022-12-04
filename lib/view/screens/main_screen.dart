import 'package:badges/badges.dart';
import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/main_screen_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Main_screen extends StatelessWidget {
  Main_screen({Key? key}) : super(key: key);
  final MainScreen_Controller mainController = Get.find();
  final Cart_Controller CartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: Text(
              mainController.screenTitle[mainController.currentIndex.value],
              style: GoogleFonts.aleo(
                  textStyle: TextStyle(
                      fontSize: 30,
                      letterSpacing: 10,
                      color: Get.isDarkMode ? LightColor : darkColor)),
            ),
            centerTitle: true,
            backgroundColor: mainController.currentIndex == 0
                ? mainColor
                : Get.isDarkMode
                    ? darkColor
                    : LightColor,
            elevation: 0,
          ),
          body: IndexedStack(
            index: mainController.currentIndex.value,
            children: mainController.screenTabs,
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    tooltip: 'Home Screen',
                    activeIcon: Text(
                      'Home',
                      style: GoogleFonts.acme(
                          textStyle: TextStyle(fontSize: 18, color: primary)),
                    ),
                    label: '',
                    icon: Column(
                      children: [
                        Icon(Icons.home,
                            color: Get.isDarkMode ? LightColor : darkColor),
                      ],
                    ),
                    backgroundColor: Get.isDarkMode ? darkColor : LightColor),
                BottomNavigationBarItem(
                    tooltip: 'Cart Screen',
                    activeIcon: Column(
                      children: [
                        Text(
                          'Cart',
                          style: GoogleFonts.acme(
                              textStyle:
                                  TextStyle(fontSize: 20, color: primary)),
                        ),
                      ],
                    ),
                    label: '',
                    icon: Badge(
                      position: BadgePosition.topEnd(top: -10, end: -10),
                      animationDuration: Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.scale,
                      badgeContent: Text(
                        '${CartController.CartCounter()}',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Container(
                          height: 25,
                          child: Image.asset(
                            'assets/images/cart.png',
                            color: Get.isDarkMode ? LightColor : darkColor,
                          )),
                    ),
                    backgroundColor: Get.isDarkMode ? darkColor : LightColor),
                BottomNavigationBarItem(
                    tooltip: 'Favorite Screen',
                    activeIcon: Text(
                      'Favorites',
                      style: GoogleFonts.acme(
                          textStyle: TextStyle(fontSize: 20, color: primary)),
                    ),
                    label: '',
                    icon: Icon(Icons.favorite,
                        color: Get.isDarkMode ? LightColor : darkColor),
                    backgroundColor: Get.isDarkMode ? darkColor : LightColor),
                BottomNavigationBarItem(
                    tooltip: 'Settings Screen',
                    activeIcon: Text(
                      'Settings',
                      style: GoogleFonts.acme(
                          textStyle: TextStyle(fontSize: 20, color: primary)),
                    ),
                    label: '',
                    icon: Icon(Icons.settings,
                        color: Get.isDarkMode ? LightColor : darkColor),
                    backgroundColor: Get.isDarkMode ? darkColor : LightColor),
              ],
              currentIndex: mainController.currentIndex.value,
              onTap: (index) {
                mainController.currentIndex.value = index;
              },
              type: BottomNavigationBarType.shifting,
            ),
          ));
    }));
  }
}
