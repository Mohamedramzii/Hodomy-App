import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Common Widgets/custom_text.dart';
import '../widgets/details widgets/AddToCart.dart';
import '../widgets/details widgets/ClothesInfo.dart';
import '../widgets/details widgets/ImageSlider.dart';
import '../widgets/details widgets/SizeList.dart';

class Details_screen extends StatelessWidget {
  Details_screen({Key? key, required this.productModel}) : super(key: key);
  final ProductsModel productModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                //Image Slider
                ImageSlider(
                  imageUrl: productModel.image!,
                ),

                //ClothesInfo
                ClothesInfo(
                  title: productModel.title!,
                  id: productModel.id!,
                  rate: productModel.rating!.rate!,
                  description: productModel.description!,
                ),
                //SizeList
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top: 13),
                  child: Custom_Text(
                      text: 'Size:',
                      fontsize: 15,
                      color: Get.isDarkMode? LightColor:darkColor,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                ),
                SizeList(),

                //AddCart
                AddToCartBar(
                  price: productModel.price!,
                  productsModel: productModel,
                ),
              ],
            ),
          )),
    );
  }
}
