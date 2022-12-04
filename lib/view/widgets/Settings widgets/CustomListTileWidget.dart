// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final Widget leadingWidget;
  final Widget text;
  Widget trailingWidget;
  
  CustomListTileWidget({
    Key? key,
    required this.leadingWidget,
    required this.text,
    required this.trailingWidget,
   
  }) : super(key: key);
  // final Settings_Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 10,),
        leadingWidget,
        SizedBox(width: 30,),
        text,
        SizedBox(width: 80,),
        trailingWidget
      ],
        );
  }
}
