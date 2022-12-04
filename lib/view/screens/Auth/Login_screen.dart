import 'package:ecommerce_app_with_getx/logic/controller/Auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/form_validations.dart';
import '../../widgets/Common Widgets/custom_Button.dart';
import '../../widgets/Common Widgets/custom_text.dart';
import '../../widgets/Common Widgets/custom_text_form_field.dart';



class Login_screen extends GetWidget<Auth_Controller> {
  Login_screen({Key? key}) : super(key: key);
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
                Lottie.asset('assets/images/login.json',
                    height: 205, width: 250, fit: BoxFit.fitWidth)
                // SvgPicture.asset(
                //   'assets/images/login.svg',
                //   width: 230,
                //   placeholderBuilder: (context)=>const CircularProgressIndicator(),
                // ),
                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Custom_Text(
                      text: 'Login',
                      fontsize: 35,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      textalign: Alignment.topLeft,
                      underline: TextDecoration.none,
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.signUpScreen),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Custom_Text(
                                text: 'Sign Up',
                                fontsize: 12,
                                color: primary,
                                textalign: Alignment.bottomRight,
                                underline: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 13,
                              color: primary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Custom_TextFormField(
                
                          icon2: const Text(''),
                          obsecure: false,
                          hinttext: 'email address',
                          onsave: (value) {
                            controller.email = value;
                          },
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value!)) {
                              return 'enter a valid email address';
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
                              icon: Icon(controller.isvisible == true
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Colors.green,
                            ),
                            hinttext: 'enter +8 characters',
                            obsecure:
                                controller.isvisible == true ? false : true,
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
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.forgetpasswordScreen),
                        child: Custom_Text(
                            text: 'Forgot Password?',
                            fontsize: 13,
                            color: Get.isDarkMode ? LightColor : darkColor,
                            textalign: Alignment.bottomRight,
                            underline: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Custom_Button(
                          onPress: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              controller.SignIN(); 
                            }
                          },
                          width: 250,
                          color: Colors.green,
                          height: 50,
                          text: 'LOGIN',
                          fontsize: 20),
                      const SizedBox(
                        height: 20,
                      ),
                      Custom_Text(
                          text: '-OR-',
                          fontsize: 15,
                          color: Get.isDarkMode ? LightColor : darkColor,
                          textalign: Alignment.center,
                          underline: TextDecoration.none),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                controller.googleSignInMethod();
                              },
                              child: Image.asset('assets/images/google.png')),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                                onTap: () {
                                  controller.FacebookSignIn();
                                },
                                child: Image.asset('assets/images/facebook.png')),
                          
                        ],
                      ),
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
