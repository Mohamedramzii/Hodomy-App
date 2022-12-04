import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../widgets/Common Widgets/Loadable_Button.dart';
import '../widgets/Common Widgets/custom_text.dart';



class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Get.isDarkMode? darkColor: Colors.white24
              // color: const Color.fromARGB(255, 241, 145, 1),
              ),
          Align(
            alignment: Alignment.centerLeft,
            child: Lottie.asset(
              'assets/images/welcome.json',
              repeat: true,
              reverse: false,
            ),
          ),
           Positioned(
              top: Get.height*0.73,
              left: Get.width*0.25,
              child: const Custom_Text(
                  text: 'HODOMY',
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontsize: 35,
                  textalign: Alignment.center,
                  underline: TextDecoration.none)),
           Positioned(
             top: Get.height*0.78,
              left: Get.width*0.41,
              child: const Custom_Text(
                  text: "Your Online Store Guide!",
                  fontsize: 10,
                  color:Colors.black,
                  textalign: Alignment.bottomCenter,
                  underline: TextDecoration.none))
          //  Positioned(
          //   top: Get.height* 0.15,
          //   left: Get.width *0.25,
          //     child: const Text('Welcome',
          //         style: TextStyle(
          //           fontSize: 40,
          //           fontWeight: FontWeight.bold,
          //           color: Color.fromARGB(255, 240, 16, 0)
          //         ))),
          //  Positioned(
          //   top: Get.height* 0.23,
          //   left: Get.width *0.26,
          //     child: const Text('To',
          //         style: TextStyle(
          //           fontSize: 40,
          //           fontWeight: FontWeight.bold,
          //           color: Color.fromARGB(255, 250, 18, 2)
          //         ))),
          ,
          Positioned(
            top: Get.height * 0.84,
            left: Get.width * 0.09,
            child: Container(
                width: 300,
                // color: Colors.black,
                alignment: Alignment.center,
                child: MyCustomWidget()),
          )
        ],
      )),
    );
  }
}
