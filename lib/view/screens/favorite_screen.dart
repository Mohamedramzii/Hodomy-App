import 'package:ecommerce_app_with_getx/logic/controller/products_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/Common Widgets/custom_text.dart';

class Favorite_Screen extends StatelessWidget {
  Favorite_Screen({Key? key}) : super(key: key);
  final Products_Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Obx(
            () => controller.FavoritesList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/heart.png',
                              color: Get.isDarkMode ? LightColor : darkColor,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Custom_Text(
                            text: 'You don\'t have any favorite products!',
                            fontsize: 17,
                            maxlines: 2,
                            color: Get.isDarkMode ? LightColor : darkColor,
                            textalign: Alignment.bottomCenter,
                            underline: TextDecoration.none),
                        SizedBox(
                          height: 10,
                        ),
                        Custom_Text(
                            text: 'Try to add some.',
                            fontsize: 17,
                            maxlines: 2,
                            color: Get.isDarkMode ? LightColor : darkColor,
                            textalign: Alignment.bottomCenter,
                            underline: TextDecoration.none),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount: controller.FavoritesList.length,
                    itemBuilder: (context, index) {
                      return _buildFavItems(
                          image: controller.FavoritesList[index].image!,
                          title: controller.FavoritesList[index].title!,
                          description:
                              controller.FavoritesList[index].description!,
                          price: controller.FavoritesList[index].price!,
                          productId: controller.FavoritesList[index].id!);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 20,
                    ),
                  ),
          )),
    );
  }

  Widget _buildFavItems(
      {required String image,
      required String title,
      required String description,
      required double price,
      required int productId}) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 120,
                height: Get.height*0.2,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              width: 175,
              // color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Custom_Text(
                      text: title,
                      color: Get.isDarkMode ? LightColor : darkColor,
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 10,
                  ),
                  Custom_Text(
                      text: description,
                      maxlines: 3,
                      color: Get.isDarkMode ? LightColor : darkColor,
                      fontsize: 11,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 10,
                  ),
                  Custom_Text(
                      text: '\$$price',
                      fontsize: 15,
                      color: primary,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {
                controller.AddFavorite(productId);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ))
        ],
      ),
    );
  }
}
