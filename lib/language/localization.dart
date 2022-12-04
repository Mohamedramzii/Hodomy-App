import 'package:get/get.dart';

import '../utils/constants.dart';
import 'ar.dart';
import 'en.dart';

class Localization extends Translations{
  @override
  Map<String, Map<String, String>> get keys {
    return {
      ene: en,
      ara: ar,
      
    } ;
  }

}