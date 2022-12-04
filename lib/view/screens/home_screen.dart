import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/Common Widgets/Custom_Search.dart';
import '../widgets/Common Widgets/custom_text.dart';
import '../widgets/categories_widgets/category_view_home.dart';
import '../widgets/home widgets/ItemsWidget.dart';


class Home_Screen extends StatelessWidget {
  Home_Screen({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                 
                  Custom_Search(),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            
            Categories_view_home(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Custom_Text(
                  text: 'Enjoy Shopping',
                  color: Get.isDarkMode ? LightColor : darkColor,
                  fontsize: 18,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
            ),
            SizedBox(
              height: 15,
            ),
            ItemsWidget()
          ],
        ),
      ),
    );
  }
}
