import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:ecommerce_app_with_getx/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/form_validations.dart';
import '../../widgets/Common Widgets/custom_Button.dart';
import '../../widgets/Common Widgets/custom_text.dart';



class ForgetPassword_screen extends GetWidget<Auth_Controller> {
  ForgetPassword_screen({Key? key}) : super(key: key);
  final TextEditingController emailcontroller = TextEditingController();
  final Auth_Controller controller = Get.find();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkColor : LightColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkColor : LightColor,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Get.isDarkMode ? LightColor : darkColor)),
          title: Text('Forgot Password',
              style: GoogleFonts.aBeeZee(
                textStyle:
                    TextStyle(color: Get.isDarkMode ? LightColor : darkColor),
              )),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Lottie.asset('assets/images/forgot.json', height: 290),
                const SizedBox(
                  height: 20,
                ),
                const Custom_Text(
                    text:
                        'If you want to recover your account, please provide your email address below.',
                    fontsize: 15,
                    maxlines: 3,
                    textalign: Alignment.topCenter,
                    underline: TextDecoration.none),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formkey,
                  child: TextFormField(
                    controller: emailcontroller,
                    onSaved: (value) {
                      emailcontroller.text = value!;
                    },
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value!)) {
                        return 'Enter a valid email address!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'enter your email address',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                  // child: Custom_TextFormField(
                  //   controller:emailcontroller,
                  //     icon2: )const Text('',
                  //     obsecure: false,
                  //     hinttext: 'email address to send ',
                  //     onsave: (value) {
                  //       controller.email = value;
                  //     },
                  //     validator: (value) {
                  //       if (!RegExp(validationEmail).hasMatch(value!)) {
                  //         return 'Enter a valid email address!';
                  //       }
                  //       return null;
                  //     },
                  //     icon: const Icon(
                  //       Icons.email,
                  //       color: Colors.green,
                  //     )),
                ),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder<Auth_Controller>(
                  builder: (_) => Custom_Button(
                      onPress: () {
                        if (formkey.currentState!.validate()) {
                          controller.ResetPassword(emailcontroller.text.trim());
                          print('done');
                          // Get.back();
                        }
                      },
                      width: 250,
                      color: Colors.green,
                      height: 50,
                      text: 'SEND',
                      fontsize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
