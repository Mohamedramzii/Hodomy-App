import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:ecommerce_app_with_getx/logic/controller/payment_controller.dart';
import 'package:ecommerce_app_with_getx/routes/routes.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class Address_Container extends StatefulWidget {
  const Address_Container({Key? key}) : super(key: key);

  @override
  State<Address_Container> createState() => _Address_ContainerState();
}

class _Address_ContainerState extends State<Address_Container> {
  int groupValueIndex = 1;
  bool cardChange = false;
  String phone_number='Add your phone number';
  final TextEditingController controller=TextEditingController();
  final Auth_Controller _auth_controller=Get.find();
  final Payment_Controller _payment_controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BuildRadioContainer(
            value: 1,
            color: cardChange ? Colors.white : Colors.grey,
            title: 'Hodomy Store',
            name: 'Hodomy',
            phone: '2132154656',
            icon: Container(),
            address: '10 st. Melsa , adrasda, Egypt',
            onchanged: (int value) {
              setState(() {
                groupValueIndex = value;
                cardChange = !cardChange;
              });
            
            }),
        SizedBox(
          height: 15,
        ),
        GetBuilder<Payment_Controller>(builder: (_)=>_BuildRadioContainer(
            value: 2,
            color: cardChange ? Colors.grey : Colors.white,
            title: 'Delivery to home',
            name: _auth_controller.displayUserName.value,
            phone: phone_number,
          
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: 'Edit Your Phone Number?',
                    titleStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.grey.shade200,
                    textCancel: 'Cancel',
                    cancelTextColor: Colors.black,
                    textConfirm: 'Save',
                    confirmTextColor: Colors.green,
                    buttonColor: Colors.transparent,
                    onCancel: () => Get.toNamed(Routes.paymentScreen),
                    onConfirm:(){
                      Get.back();
                      setState(() {
                        phone_number=controller.text;
                      });
                    },
                    content: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: controller,
                        cursorColor: primary,
                        maxLength: 11,
                        onSubmitted: (value){
                          controller.text=value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Edit Your Number ',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          fillColor: Get.isDarkMode
                              ? darkColor.withOpacity(0.4)
                              : Colors.grey.shade300,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? LightColor : primary,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ));
              },
              child: Icon(
                Icons.edit,
                size: 20,
              ),
            ),
            address:
                _payment_controller.address.value,
            onchanged: (int value) {
              setState(() {
                groupValueIndex = value;
                cardChange = !cardChange;
              });
                _payment_controller.updatePosition();
            }),)
      ],
    );
  }

  Widget _BuildRadioContainer({
    required int value,
    required Color color,
    required Function onchanged,
    required String title,
    required String name,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 145,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            fillColor: MaterialStateProperty.resolveWith((states) => primary),
            value: value,
            groupValue: groupValueIndex,
            onChanged: (value) {
              onchanged(value);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Custom_Text(
                      text: title,
                      fontsize: 20,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 10,
                  ),
                  Custom_Text(
                      text: name,
                      fontsize: 15,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Custom_Text(
                          text: '🇪🇬+02 ',
                          fontsize: 15,
                          textalign: Alignment.topLeft,
                          underline: TextDecoration.none),
                      Custom_Text(
                          text: phone,
                          fontsize: 15,
                          textalign: Alignment.topLeft,
                          underline: TextDecoration.none),
                      SizedBox(
                        width: 30,
                      ),
                      icon,
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Custom_Text(
                      maxlines: 2,
                      text: address,
                      fontsize: 13,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
