import 'package:ecommerce_app_with_getx/logic/controller/products_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_Search extends StatelessWidget {
  Custom_Search({Key? key}) : super(key: key);
  final Products_Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Products_Controller>(
      builder: (_) => TextField(
        
        controller: controller.searchTextController,
        cursorColor: primary,
        onChanged: (searchName) {
          controller.SearchLogic(searchName);
        },
        decoration: InputDecoration(
          hintText: 'what are you looking for?',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          fillColor: Get.isDarkMode ? darkColor.withOpacity(0.4) :Colors.grey.shade300 ,
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Get.isDarkMode ? LightColor :primary,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty? IconButton(
              onPressed: () {
                controller.clearsearch();
              },
              icon: Icon(
                Icons.close,
                color: Get.isDarkMode ? LightColor :primary,
              )):null,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
