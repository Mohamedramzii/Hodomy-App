import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routes.dart';
import '../../utils/constants.dart';

class Settings_Controller extends GetxController {
  var isSwitched = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

  String Capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  @override
  void onInit() async {
    langLocal = await getLanguage;
    super.onInit();
  }
  //**********------LANGUAGE------***************

  //Save Language
  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  //get Language
  Future<String> get getLanguage async {
    return await storage.read<String>('lang').toString();
  }

  //change Language
  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
