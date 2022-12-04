import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../Common Widgets/custom_text.dart';


class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final Auth_Controller controller = Get.find<Auth_Controller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Auth_Controller>(
      builder: (controller) => Row(
        children: [
          InkWell(
            onTap: () {
              controller.BoxChecked();
            },
            child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                child: controller.isChecked
                    ? Image.asset('assets/images/check.png')
                    : Container()),
          ),
          const SizedBox(
            width: 5,
          ),
          Custom_Text(
              text: 'I Agree Terms & Conditions',
              color:controller.isChecked==false ? Get.isDarkMode ? Colors.red : Colors.red : LightColor,
              fontsize: 13,
              textalign: Alignment.centerLeft,
              underline: TextDecoration.none)
        ],
      ),
    );
  }
}
