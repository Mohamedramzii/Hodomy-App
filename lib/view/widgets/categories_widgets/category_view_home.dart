import 'package:ecommerce_app_with_getx/logic/controller/category_controller.dart';
import 'package:ecommerce_app_with_getx/view/screens/Category/category_Items_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Common Widgets/custom_text.dart';

class Categories_view_home extends StatelessWidget {
  Categories_view_home({Key? key}) : super(key: key);
  final Category_Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isCategoryLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 130,
              margin: EdgeInsets.only(left: 8),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        controller.getCategoryProducts(
                            controller.categoryNameList[index]);
                        Get.to(() => Category_items_screen(
                          categoryTitle: controller.categoryNameList[index].toString(),
                        ));
                      },
                      child: Column(
                        children: [
                          Container(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                    controller.categoryImagesList[index]),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Custom_Text(
                            text: index == 2 || index == 3
                                ? controller.categoryNameList[index]
                                    .substring(0, index == 2 ? 3 : 5)
                                    .capitalize!
                                : controller
                                    .categoryNameList[index].capitalize!,
                            fontsize: 14,
                            fontWeight: FontWeight.bold,
                            underline: TextDecoration.none,
                            textalign: Alignment.center,
                          )
                        ],
                      ));
                },
                itemCount: controller.categoryNameList.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 20,
                  );
                },
              ),
            );
    });
  }
}
