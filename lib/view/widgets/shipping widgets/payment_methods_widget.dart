import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int groupvalueIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          PaymentMethodContainer(
              color: Colors.grey.shade200,
              imageUrl: 'assets/images/paypal.png',
              scale: 0.5,
              title: 'Paypal',
              value: 1,
              onchanged: (int value) {
                setState(() {
                  groupvalueIndex = value;
                });
              }),
          SizedBox(
            height: 5,
          ),
          PaymentMethodContainer(
              color: Colors.grey.shade200,
              imageUrl: 'assets/images/google.png',
              scale: 0.7,
              title: 'GooglePay',
              value: 2,
              onchanged: (int value) {
                setState(() {
                  groupvalueIndex = value;
                });
              }),
        ],
      ),
    );
  }

  Widget PaymentMethodContainer({
    required Color color,
    required String imageUrl,
    required String title,
    required int value,
    required double scale,
    required Function onchanged,
  }) {
    return Container(
      // alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imageUrl,
                  scale: scale,
                ),
                SizedBox(
                  width: 10,
                ),
                Custom_Text(
                    text: title,
                    fontWeight: FontWeight.bold,
                    color: darkColor,
                    fontsize: 18,
                    textalign: Alignment.center,
                    underline: TextDecoration.none),
                SizedBox(
                  width: 60,
                ),
              ],
            ),
            Radio(
              overlayColor:
                  MaterialStateProperty.resolveWith((states) => primary),
              fillColor: MaterialStateProperty.resolveWith((states) => primary),
              value: value,
              groupValue: groupvalueIndex,
              onChanged: (value) {
                onchanged(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
