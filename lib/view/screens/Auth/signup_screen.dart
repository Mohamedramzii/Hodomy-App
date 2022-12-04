import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:ecommerce_app_with_getx/utils/form_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../widgets/Auth widgets/CheckWidget.dart';
import '../../widgets/Common Widgets/custom_Button.dart';
import '../../widgets/Common Widgets/custom_text.dart';
import '../../widgets/Common Widgets/custom_text_form_field.dart';


class SignUp_Screen extends GetWidget<Auth_Controller> {
  SignUp_Screen({Key? key}) : super(key: key);
// TextEditingController tcontroller=TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkColor : LightColor,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/images/signup.json',
                  height: 180,
                )
                // SvgPicture.asset(
                //   'assets/images/login.svg',
                //   width: 230,
                //   placeholderBuilder: (context)=>const CircularProgressIndicator(),
                // ),
                ,
                const Custom_Text(
                  text: 'Sign Up',
                  fontsize: 35,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Custom_TextFormField(
                          icon2: const Text(''),
                          obsecure: false,
                          hinttext: 'username',
                          onsave: (value) {
                            controller.name = value;
                          },
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value!)) {
                              return 'Enter a valid username!';
                            }
                            return null;
                          },
                          icon: const Icon(
                            Icons.person,
                            color: Colors.green,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Custom_TextFormField(
                          icon2: const Text(''),
                          obsecure: false,
                          hinttext: 'email address',
                          onsave: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value!)) {
                              return 'Enter a valid email address!';
                            }
                            return null;
                          },
                          icon: const Icon(
                            Icons.email,
                            color: Colors.green,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      GetBuilder<Auth_Controller>(
                        builder: (controller) => Custom_TextFormField(
                            icon2: IconButton(
                              onPressed: () {
                                controller.PasswordVisibility();
                              },
                              icon: Icon(
                                controller.isvisible == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: Colors.green,
                            ),
                            hinttext: 'enter +8 characters',
                            obsecure: controller.isvisible ? false : true,
                            onsave: (value) {
                              controller.password = value;
                            },
                            validator: (value) {
                              if (value!.length < 8) {
                                return 'password must be at least 8 characters';
                              }
                              return null;
                            },
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.green,
                            )),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Custom_Text(
                              text: 'Already have an account?',
                              fontsize: 12,
                              color: Get.isDarkMode ? LightColor : darkColor,
                              textalign: Alignment.bottomRight,
                              underline: TextDecoration.underline),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.loginScreen),
                            child: Custom_Text(
                                text: 'Login',
                                fontsize: 13,
                                color: Get.isDarkMode ? LightColor : darkColor,
                                textalign: Alignment.bottomRight,
                                underline: TextDecoration.none),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      Custom_Button(
                          onPress: () {
                            if (formkey.currentState!.validate() &&
                                controller.isChecked == true) {
                              formkey.currentState!.save();
                              print('Saved');
                              controller.SignUp();
                            }
                          },
                          width: 250,
                          color: Colors.green,
                          height: 50,
                          text: 'SIGN UP',
                          fontsize: 20)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
