import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/category_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/products_controller.dart';
import 'package:ecommerce_app_with_getx/model/products_model.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../widgets/Common Widgets/custom_text.dart';

class Category_items_screen extends StatelessWidget {
  final String categoryTitle;
  Category_items_screen({Key? key, required this.categoryTitle}) : super(key: key);
  final Products_Controller controller = Get.find<Products_Controller>();
  final Cart_Controller Cartcontroller = Get.find<Cart_Controller>();
  final Category_Controller Categorycontroller =
      Get.find<Category_Controller>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
            elevation: 0,
            title: Text(categoryTitle,
                style: TextStyle(
                  color: Get.isDarkMode ? LightColor : darkColor,
                )),
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? darkColor : LightColor,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Get.isDarkMode ? LightColor : darkColor,
                ))),
        body: Obx(
          () => Categorycontroller.isCategoryProductsLoading.value ==true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.63,
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return _buildItemsWidget(
                        image: Categorycontroller.categoryProductsList[index].image,
                        price: Categorycontroller.categoryProductsList[index].price,
                        rate: Categorycontroller.categoryProductsList[index].rating!.rate,
                        productId: Categorycontroller.categoryProductsList[index].id,
                        productsModel: Categorycontroller.categoryProductsList[index],
                        ontap: () => Get.to(() => Details_screen(
                            productModel: Categorycontroller.categoryProductsList [index])));
                  },
                  itemCount: Categorycontroller.categoryProductsList.length),
        ));
  }

  Widget _buildItemsWidget(
      {required String? image,
      required double? price,
      required double? rate,
      required int? productId,
      required ProductsModel productsModel,
      required Function() ontap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
                height: Get.height * 0.24,
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
