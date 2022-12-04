import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_with_getx/logic/controller/cart_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../routes/routes.dart';
import 'Color_picker.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final Cart_Controller Cartcontroller = Get.find<Cart_Controller>();
  int currentIndex = 0;
  int currentColor = 0;
  final List<Color> colorsList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              // color: Get.isDarkMode ? darkColor : Colors.grey.shade200,
              child: CarouselSlider.builder(
                itemCount: 3,
                carouselController: carouselController,
                options: CarouselOptions(
                    height: 400,
                    // viewportFraction: 0.75,
                    // aspectRatio: 2.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                itemBuilder: (context, index, realindex) {
                  return Container(
                    // height: 300,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // border:Border.all(color: darkColor)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(widget.imageUrl)),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              child: Container(
                height: 200,
                width: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.separated(
                  itemCount: colorsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: Color_picker(
                          color: colorsList[index],
                          outerBorder: currentColor == index ? true : false),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 1,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 15,
                    )),
              ),
            ),
            
                Positioned(
              top: 10,
              right: 10,
              
              child: Badge(
              position: BadgePosition.topEnd(top: -10, end: -5),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.scale,
              badgeContent: Text(
                '${Cartcontroller.CartCounter()}',
                style: TextStyle(color: Colors.white),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 45,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: IconButton(
                    onPressed: () =>Get.toNamed(Routes.cartsScreen),
                    icon: Icon(
                      Icons.shopping_cart,
                      color:Get.isDarkMode ? LightColor:darkColor,
                      size: 20,
                    )),
              ),
            ),
                )
          ],
        ),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: 3,
          effect: WormEffect(
              dotHeight: 7,
              dotWidth: 15,
              activeDotColor: primary,
              paintStyle: PaintingStyle.fill,
              dotColor: Get.isDarkMode ? LightColor : darkColor),
        )
      ],
    );
  }
}
