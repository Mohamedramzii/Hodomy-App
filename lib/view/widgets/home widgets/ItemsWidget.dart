import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/products_controller.dart';
import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Common Widgets/custom_text.dart';

class ItemsWidget extends StatelessWidget {
  ItemsWidget({Key? key}) : super(key: key);
  final Products_Controller controller = Get.find<Products_Controller>();
  final Cart_Controller Cartcontroller = Get.find<Cart_Controller>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
          color: primary,
        ));
      } else {
        return Expanded(
          child: controller.SearchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset(
                      'assets/images/search_empty_dark.png',
                    )
                  : Image.asset(
                      'assets/images/search_empry_light.png',
                    )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.63,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return controller.SearchList.isEmpty
                        ? _buildItemsWidget(
                            image: controller.productsList[index].image,
                            price: controller.productsList[index].price,
                            rate: controller.productsList[index].rating!.rate,
                            productId: controller.productsList[index].id,
                            productsModel: controller.productsList[index],
                            ontap: () => Get.to(() => Details_screen(
                                productModel: controller.productsList[index])))
                        : _buildItemsWidget(
                            image: controller.SearchList[index].image,
                            price: controller.SearchList[index].price,
                            rate: controller.SearchList[index].rating!.rate,
                            productId: controller.SearchList[index].id,
                            productsModel: controller.SearchList[index],
                            ontap: () => Get.to(() => Details_screen(
                                productModel: controller.SearchList[index])));
                  },
                  itemCount: controller.SearchList.isEmpty
                      ? controller.productsList.length
                      : controller.SearchList.length),
        );
      }
    });
  }

  Widget _buildItemsWidget(
      {required String? image,
      required double? price,
      required double? rate,
      required int? productId,
      required ProductsModel productsModel,
      required Function() ontap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8,bottom: 8),
      child: InkWell(
        onTap: ontap,
        child: Container(
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.pink,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 2)
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => IconButton(
                        onPressed: () {
                          controller.AddFavorite(productId!);
                        },
                        icon: controller.isFavorite(productId!)
                            ? Icon(Icons.favorite, size: 20, color: Colors.red)
                            : Icon(
                                Icons.favorite_border,
                                size: 20,
                                color: Get.isDarkMode ? LightColor : darkColor,
                              )),
                  ),
                  IconButton(
                      onPressed: () {
                        Cartcontroller.addProductToCart(productsModel);
                        Fluttertoast.showToast(
                          msg: 'Item is added to cart',
                          textColor: Get.isDarkMode ? darkColor : LightColor,
                          backgroundColor:
                              Get.isDarkMode ? LightColor : darkColor,
                        );
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: Get.isDarkMode ? LightColor : darkColor,
                      )),
                ],
              ),
              Container(
                width: double.infinity,
                height: Get.height * 0.23,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Custom_Text(
                        text: '\$$price',
                        color: Get.isDarkMode ? LightColor : darkColor,
                        fontsize: 15,
                        textalign: Alignment.bottomLeft,
                        underline: TextDecoration.none),
                    Container(
                      width: 36,
                      height: 20,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 12,
                            ),
                            Custom_Text(
                                text: '$rate',
                                fontsize: 11,
                                color: Get.isDarkMode ? LightColor : darkColor,
                                textalign: Alignment.centerRight,
                                underline: TextDecoration.none)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
