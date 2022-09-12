import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  RxBool isLightTheme = true.obs;
  final prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', isLightTheme.value);
  }

}