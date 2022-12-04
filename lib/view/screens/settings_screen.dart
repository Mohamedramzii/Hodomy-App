import 'package:ecommerce_app_with_getx/view/widgets/Common%20Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/controller/Auth_controller.dart';
import '../../logic/controller/settings_controller.dart';
import '../../logic/theme_controller.dart';
import '../../utils/constants.dart';
import '../widgets/Settings widgets/CustomListTileWidget.dart';
import '../widgets/Settings widgets/Custom_profile_details.dart';

class Settings_Screen extends StatelessWidget {
  Settings_Screen({Key? key}) : super(key: key);
  final Settings_Controller controller = Get.find();
  final Auth_Controller _auth_controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // padding: EdgeInsets.all(24),
            children: [
              Custom_Profile_details(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Custom_Text(
                  text: 'Settings'.tr,
                  fontsize: 18,
                  textalign: Alignment.topLeft,
                  underline: TextDecoration.none),
              SizedBox(
                height: 20,
              ),
              //Dark Mode
              GetBuilder<Settings_Controller>(
                builder: (_) => CustomListTileWidget(
                  leadingWidget: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkSettings,
                    ),
                    child: Icon(
                      Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                  text: Custom_Text(
                      text: Get.isDarkMode ? 'Light Mode'.tr : 'Dark Mode'.tr,
                      fontsize: 18,
                      color: Get.isDarkMode ? LightColor : darkColor,
                      fontWeight: FontWeight.bold,
                      textalign: Alignment.centerLeft,
                      underline: TextDecoration.none),
                  trailingWidget: Switch(
                      value: controller.isSwitched.value,
                      onChanged: (value) {
                        ThemeController().ChangeTheme();
                        controller.isSwitched.value = value;
                      }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //LanguageWidget()
              GetBuilder<Settings_Controller>(
                builder: (_) => CustomListTileWidget(
                  leadingWidget: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: languageSettings,
                    ),
                    child: Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                  text: Custom_Text(
                      text: 'Language'.tr,
                      fontsize: 18,
                      color: Get.isDarkMode ? LightColor : darkColor,
                      fontWeight: FontWeight.bold,
                      textalign: Alignment.centerLeft,
                      underline: TextDecoration.none),
                  trailingWidget: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Get.isDarkMode ? LightColor : darkColor,
                      ),
                      value: controller.langLocal,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            arabic,
                            style: TextStyle(),
                          ),
                          value: ara,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            english,
                            style: TextStyle(),
                          ),
                          value: ene,
                        ),
                      ],
                      onChanged: (value) {
                        controller.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //LogoutWidget
              GetBuilder<Settings_Controller>(
                builder: (_) => InkWell(
                  onTap: () => Get.defaultDialog(
                      title: 'Logout from HODOMY?😢',
                      titleStyle: GoogleFonts.acme(textStyle: TextStyle()),
                      middleText: 'Are you sure you need to logout ?',
                      middleTextStyle: GoogleFonts.akayaKanadaka(
                          textStyle: TextStyle(fontSize: 20)),
                      // radius: 20
                      textCancel: 'No',
                      cancelTextColor: primary,
                      textConfirm: 'Yes',
                      confirmTextColor: Colors.red,
                      onCancel: () => Get.back(),
                      onConfirm: () => _auth_controller.SignOut(),
                      buttonColor: Colors.transparent),
                  child: CustomListTileWidget(
                    leadingWidget: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkSettings,
                      ),
                      child: Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                    text: Custom_Text(
                        text: 'Logout'.tr,
                        fontsize: 18,
                        color: Get.isDarkMode ? LightColor : darkColor,
                        fontWeight: FontWeight.bold,
                        textalign: Alignment.centerLeft,
                        underline: TextDecoration.none),
                    trailingWidget: Container(
                      height: 0,
                      width: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
