import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';
import '../widgets/Common Widgets/custom_text.dart';
import '../widgets/cart widgets/Cart_products_widget.dart';
import '../widgets/cart widgets/cart_total.dart';


class Cart_screen extends StatelessWidget {
  Cart_screen({Key? key}) : super(key: key);

  final controller = Get.find<Cart_Controller>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
            child: Obx(
          () => controller.productsMap.isEmpty
              ? empty_cart()
              : Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: Get.height * 0.75,
                      child: ListView.separated(
                        itemCount: controller.productsMap.length,
                        itemBuilder: (context, index) {
                          return Cart_products_widget(
                            // our map -->its key--> as it is list so return it into list again-->its index
                            productsModel:
                                controller.productsMap.keys.toList()[index],
                            index: index,
                            quantity:
                                controller.productsMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                    Cart_total_widget()
                  ],
                ),
        )),
      ),
    );
  }

  Widget empty_cart() {
    return Container(
     height: Get.height *0.9,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 200,
                width: 250,
                child: Lottie.asset(
                  'assets/images/empty_cart.json',
                )),
            Custom_Text(
                text: 'Your Cart is empty!',
                fontsize: 18,
                color:Get.isDarkMode ? LightColor:darkColor ,
                textalign: Alignment.center,
                underline: TextDecoration.none),
          ],
        ),
      ),
    );
  }
}
