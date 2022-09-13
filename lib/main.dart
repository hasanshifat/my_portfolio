import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_web/constants/colors.dart';
import 'package:my_portfolio_web/controller/theme_coltroller.dart';
import 'package:my_portfolio_web/view/site_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent.withOpacity(0.1),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
        color: CustomColors.colorWhite,
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal),
    labelLarge: const TextStyle(
        fontSize: 12.0,
        fontStyle: FontStyle.normal,
        color: CustomColors.colorBlack),
    bodyLarge: const TextStyle(
        fontSize: 14.0, fontStyle: FontStyle.normal, color: Colors.white),
    bodyMedium: const TextStyle(
        fontSize: 12.0, fontStyle: FontStyle.normal, color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          backgroundColor: MaterialStateProperty.all(CustomColors.colorGreen))),
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
          color: CustomColors.colorBlack,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal),
      labelLarge: const TextStyle(
          fontSize: 12.0, fontStyle: FontStyle.normal, color: Colors.white),
      bodyLarge: const TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          color: Colors.white,
          letterSpacing: 0.5),
      bodyMedium: const TextStyle(
          fontSize: 12.0,
          fontStyle: FontStyle.normal,
          color: CustomColors.colorWhite),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor:
                MaterialStateProperty.all(CustomColors.colorGreyDark))),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());

  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // getThemeStatus();
    super.initState();
  }

  getThemeStatus() async {
    var isLight = prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    themeController.isLightTheme.value = await isLight.value;
    Get.changeThemeMode(
        themeController.isLightTheme.value ? ThemeMode.dark : ThemeMode.light);
  }

  saveThemeStatus() async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', themeController.isLightTheme.value);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SiteLayout(),
    );
  }
}
