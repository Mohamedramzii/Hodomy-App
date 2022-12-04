import 'package:ecommerce_app_with_getx/logic/controller/products_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int id;
  final String description;
  double rate;
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.id,
      required this.rate,
      required this.description})
      : super(key: key);
  final Products_Controller products_controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: Custom_Text(
                    text: title,
                    fontsize: 20,
                    color: Get.isDarkMode ? LightColor : darkColor,
                    textalign: Alignment.topLeft,
                    underline: TextDecoration.none),
              ),
              Obx(() => Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.isDarkMode
                            ? LightColor
                            : darkColor.withOpacity(0.3)),
                    child: IconButton(
                        onPressed: () {
                          products_controller.AddFavorite(id);
                          Fluttertoast.showToast(
                          msg: 'Item is added to your favorites',
                          textColor: Get.isDarkMode ? darkColor:LightColor ,
                          backgroundColor: Get.isDarkMode ? LightColor:darkColor ,
                        );
                        },
                        icon: products_controller.isFavorite(id)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Get.isDarkMode ? darkColor : LightColor,
                                size: 20,
                              )),
                  ))
            ]),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RatingStars(
                value: rate,
                // onValueChanged: (v) {
                //   //
                //   setState(() {
                //     widget.rate = v;
                //   });
                // },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  size: 18,
                  color: color,
                ),
                starCount: 5,
                starSize: 20,
                valueLabelColor: Get.isDarkMode ? darkColor : LightColor,
                valueLabelTextStyle: TextStyle(
                    color: Get.isDarkMode ? LightColor : darkColor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
                valueLabelRadius: 10,
                maxValue: 5,
                starSpacing: 2,
                maxValueVisibility: false,
                valueLabelVisibility: true,
                animationDuration: Duration(milliseconds: 2000),
                valueLabelPadding: const EdgeInsets.symmetric(horizontal: 3),
                valueLabelMargin: const EdgeInsets.only(right: 3),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Colors.yellow,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ReadMoreText(
              description,
              style: TextStyle(
                  color: Get.isDarkMode
                      ? LightColor.withOpacity(0.5)
                      : darkColor.withOpacity(0.5)),
              trimLines: 3,
              textAlign: TextAlign.justify,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              lessStyle: TextStyle(fontWeight: FontWeight.bold, color: primary),
              moreStyle: TextStyle(fontWeight: FontWeight.bold, color: primary),
            )
          ],
        ));
  }
}
