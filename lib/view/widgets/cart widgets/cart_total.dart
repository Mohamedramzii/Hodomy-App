import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/routes/routes.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Common Widgets/custom_Button.dart';
import '../Common Widgets/custom_text.dart';

class Cart_total_widget extends StatelessWidget {
  Cart_total_widget({Key? key}) : super(key: key);
  final controller = Get.find<Cart_Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.01,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                  text: 'Total',
                  fontsize: 13,
                  color: Get.isDarkMode ? LightColor : Colors.grey.shade400,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
              Obx(
                () => Custom_Text(
                    text: '\$${controller.Total}',
                    fontsize: 20,
                    color: primary,
                    textalign: Alignment.topLeft,
                    underline: TextDecoration.none),
              )
            ],
          ),
          Custom_Button(
              onPress: () => Get.toNamed(Routes.paymentScreen),
              width: 200,
              height: 40,
              text: 'CHECKOUT',
              color: primary,
              fontsize: 20)
        ],
      ),
    );
  }
}
