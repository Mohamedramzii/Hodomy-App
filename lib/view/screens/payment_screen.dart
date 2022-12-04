import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_Button.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:ecommerce_app_with_getx/view/widgets/shipping%20widgets/payment_methods_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/shipping widgets/address_container.dart';

class Payment_Screen extends StatelessWidget {
  const Payment_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Text('Shipping Details',
            style: GoogleFonts.aleo(
                textStyle: TextStyle(
                    color: Get.isDarkMode ? LightColor : darkColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new,
                color: Get.isDarkMode ? LightColor : darkColor)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //Text
              Custom_Text(
                  text: 'Shipping to',
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? LightColor : darkColor,
                  fontsize: 18,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
              SizedBox(
                height: 15,
              ),
              //address shop card
              Address_Container(),
              SizedBox(
                height: 25,
              ),
              //payment method text
              Custom_Text(
                  text: 'Payment Methods',
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? LightColor : darkColor,
                  fontsize: 18,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
              SizedBox(
                height: 15,
              ),
              //payment methods
              PaymentMethod(),
              SizedBox(
                height: 15,
              ),
              Custom_Text(
                  text: 'Total: \$200',
                  color: primary,
                  fontsize: 17,
                  textalign: Alignment.center,
                  underline: TextDecoration.none),
              Center(
                child: Custom_Button(
                    onPress: () {},
                    width: 140,
                    color: primary,
                    height: 40,
                    text: 'Pay Now',
                    fontsize: 15),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
