// ignore_for_file: must_be_immutable

import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';

import '../Common Widgets/custom_text.dart';



class Cart_products_widget extends StatelessWidget {
  ProductsModel productsModel;
  final int index;
  final int quantity;
  Cart_products_widget({
    Key? key,
    required this.productsModel,
    required this.index, required this.quantity,
  }) : super(key: key);

  final Cartcontroller = Get.find<Cart_Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.21,
      child: Row(
        children: [
          Container(
            width: 140,
            height: Get.height * 0.2,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                productsModel.image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Custom_Text(
                    text: productsModel.title!,
                    fontsize: 17,
                    color: Get.isDarkMode ? LightColor : darkColor,
                    fontWeight: FontWeight.bold,
                    textalign: Alignment.topLeft,
                    underline: TextDecoration.none),
                SizedBox(
                  height: 15,
                ),
                Custom_Text(
                    text: productsModel.description!,
                    maxlines: 3,
                    color: Get.isDarkMode ? LightColor : darkColor,
                    fontsize: 14,
                    textalign: Alignment.topLeft,
                    underline: TextDecoration.none),
                SizedBox(
                  height: 15,
                ),
                Custom_Text(
                    text: '\$${Cartcontroller.productSubtotal[index].toStringAsFixed(2)}',
                    fontsize: 15,
                    color: primary,
                    textalign: Alignment.topLeft,
                    underline: TextDecoration.none),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    quantity_widget(),
                    // SizedBox(width: 10,),
                    IconButton(
                        onPressed: () {
                          Cartcontroller.removeOneProductFromCart(
                              productsModel);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget quantity_widget() => Expanded(
    child: Container(
          padding: EdgeInsets.all(2),
          width: 105,
          height: 40,
          decoration: BoxDecoration(
              color: mainColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      onPressed: () {
                        Cartcontroller.addProductToCart(productsModel);
                      },
                      icon: Icon(Icons.add))),
              Custom_Text(
                  text: '$quantity',
                  color: Get.isDarkMode ? LightColor : darkColor,
                  fontsize: 15,
                  textalign: Alignment.center,
                  underline: TextDecoration.none),
              Container(
                  height: 45,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      onPressed: () {
                        Cartcontroller.removeProductInCondition(productsModel);
                      },
                      icon: Icon(Icons.remove))),
            ],
          ),
        ),
  );
}
