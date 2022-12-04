import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/settings_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_Profile_details extends StatelessWidget {
  Custom_Profile_details({Key? key}) : super(key: key);
  final Settings_Controller controller = Get.find();
  final Auth_Controller authcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: authcontroller.displayUserPhoto.value == ''
                  ? Image.asset('assets/images/empty_proile.png')
                  : Image.network(
                      authcontroller.displayUserPhoto.value,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                  text: controller.Capitalize(
                      authcontroller.displayUserName.value),
                  color: Get.isDarkMode ? LightColor : darkColor,
                  fontsize: 17,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
              SizedBox(
                height: 10,
              ),
              Custom_Text(
                  text: authcontroller.userEmail.value,
                  color: Get.isDarkMode ? LightColor : darkColor,
                  fontsize: 12,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
            ],
          ),
        ],
      ),
    );
  }
}
