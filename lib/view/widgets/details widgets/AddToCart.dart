import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddToCartBar extends StatelessWidget {
  final double price;
  final ProductsModel productsModel;
   AddToCartBar({Key? key, required this.price, required this.productsModel}) : super(key: key);
final Cart_Controller controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                  text: 'Price',
                  fontsize: 15,
                  color: Colors.grey,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
              SizedBox(
                height: 5,
              ),
              Custom_Text(
                  text: '\$$price',
                  fontsize: 20,
                  color: primary,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none)
            ],
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Container(
              height: 45,
              width: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primary,
              ),
              child: GestureDetector(
                onTap: () {
                  controller.addProductToCart(productsModel);
                  Fluttertoast.showToast(
                            msg: 'Item is added to cart',
                            textColor: Get.isDarkMode ? darkColor:LightColor ,
                            backgroundColor: Get.isDarkMode ? LightColor:darkColor ,
                            
                          );
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 55,),
                    Custom_Text(
                        text: 'Add to cart',
                        fontsize: 20,
                        color: Get.isDarkMode ? LightColor : darkColor,
                        textalign: Alignment.centerLeft,
                        underline: TextDecoration.none),
                         SizedBox(width: 15,),
                    Icon(Icons.shopping_cart,
                        color: Get.isDarkMode ? LightColor : darkColor),
                      
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
