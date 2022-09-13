import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_web/constants/colors.dart';
import 'package:my_portfolio_web/constants/paddings.dart';
import 'package:my_portfolio_web/constants/page_size.dart';
import 'package:my_portfolio_web/controller/theme_coltroller.dart';
import 'package:my_portfolio_web/widgets/Hovering/top_bar_item_hover.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/responsiveness.dart';
import '../widgets/Hovering/onIconHover.dart';
import 'dart:js' as js;
import 'dart:html' as html;

class LargeScreen extends StatefulWidget {
  const LargeScreen({super.key});

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    Size _pageSize = PageSize().pageSize(context);
    return Container(
      color: CustomColors.colorWhite,
      child: Column(
        children: [
          introContainer(),
          Container(
            color: Colors.blue.withOpacity(0.05),
            height: _pageSize.height * 0.7,
            child: Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Hello There !',
                      style: GoogleFonts.montserrat(
                          color: CustomColors.colorGreyDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I'M ",
                            style: GoogleFonts.montserrat(
                                color: CustomColors.colorGreyDark,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontStyle: FontStyle.normal),
                          ),
                          TextSpan(
                            text: 'FLUTTER DEVELOPER',
                            style: GoogleFonts.montserrat(
                                color: CustomColors.colorGreen,
                                fontSize: 35,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hi , I’m professional mobile application developer,',
                      style: GoogleFonts.montserrat(
                          color: CustomColors.colorGreyDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal),
                    ),
                    Text(
                      'Five years of experience.',
                      style: GoogleFonts.montserrat(
                          color: CustomColors.colorGreyDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          fontStyle: FontStyle.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {
                            Uri uri = Uri.parse("https://flutter.io");
                            _launchInBrowser(uri);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColors.colorGreen)),
                          child: Text(
                            'Contact Me',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    sociaIcons()

                    // SizedBox(
                    //   width: 250.0,
                    //   child: DefaultTextStyle(
                    //     style: GoogleFonts.montserrat(
                    //         color: CustomColors.colorGreyDark,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w500,
                    //         fontStyle: FontStyle.normal),
                    //     child: AnimatedTextKit(
                    //       pause: const Duration(milliseconds: 1000),
                    //       repeatForever: true,
                    //       animatedTexts: [
                    //         TyperAnimatedText("I'M FLUTTER DEVELOPER"),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const Spacer(),
                myPicture(_pageSize),
                const SizedBox(
                  width: PaddingDeafult.vertical_10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: PaddingDeafult.vertical_10,
          ),
        ],
      ),
    );
  }

  _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Row sociaIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OnIconHover(
          onTap: () {
            Uri uri =
                Uri.parse("https://www.facebook.com/hasanshifat.official");
            _launchInBrowser(uri);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/facebook.png',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OnIconHover(
          onTap: () {
            Uri uri = Uri.parse("https://bd.linkedin.com/in/mh-shifat91");
            _launchInBrowser(uri);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/linkedin.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OnIconHover(
          onTap: () {
            Uri uri = Uri.parse("https://join.skype.com/invite/ESBn1fNYXNzq");
            _launchInBrowser(uri);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/skype.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OnIconHover(
          onTap: () {
            Uri uri = Uri.parse(
                "https://twitter.com/Shifat26778854?t=huIrffTp2opYyoVUp0JlDg&s=09");
            _launchInBrowser(uri);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/twitter.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OnIconHover(
          onTap: () {
            Uri uri = Uri.parse("https://github.com/hasanshifat");
            _launchInBrowser(uri);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/github.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        OnIconHover(
          onTap: () {
            Uri uri = Uri.parse("https://www.instagram.com/_iamshifat/");
            _launchInBrowser(uri);
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                'assets/images/instagram.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  introContainer() {
    return Container(
      height: 80,
      width: double.infinity,
      color: CustomColors.colorWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingDeafult.horizontal_15),
        child: Row(
          children: [
            const SizedBox(
              width: PaddingDeafult.horizontal_10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Mahmudul Hasan',
                    style: GoogleFonts.roboto(
                        color: CustomColors.colorGreyDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal),
                  ),
                  TextSpan(
                    text: ' Shifat',
                    style: GoogleFonts.roboto(
                      color: CustomColors.colorYellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            OnTopBarItemHover(
                onTap: () {
                  setState(() {});
                },
                text: 'Home'),
            OnTopBarItemHover(onTap: () {}, text: 'About'),
            OnTopBarItemHover(onTap: () {}, text: 'Service'),
            OnTopBarItemHover(onTap: () {}, text: 'Blog'),
            OnTopBarItemHover(onTap: () {}, text: 'Contact'),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 40,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Hire me',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
            ),

            // ObxValue(
            //   (data) => Switch(
            //     value: themeController.isLightTheme.value,
            //     onChanged: (val) {
            //       setState(() {
            //         themeController.isLightTheme.value = val;

            //         Get.changeThemeMode(
            //           themeController.isLightTheme.value
            //               ? ThemeMode.dark
            //               : ThemeMode.light,
            //         );
            //       });
            //       themeController.saveThemeStatus();
            //     },
            //     activeTrackColor: CustomColors.colorPink,
            //     inactiveThumbImage: const AssetImage(
            //       'assets/images/sun.png',
            //     ),
            //     activeThumbImage:
            //         const AssetImage('assets/images/moon.png'),
            //   ),
            //   false.obs,
            // ),
          ],
        ),
      ),
    );
  }

  myPicture(Size pageSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingDeafult.vertical_15),
      child: CircleAvatar(
        radius: ResponsiveWidget.isLargelScreen(context)
            ? pageSize.height * 0.4
            : ResponsiveWidget.isMediumScreen(context)
                ? pageSize.height * 0.2
                : 0,
        backgroundColor: CustomColors.colorGreen,
        child: Padding(
          padding: const EdgeInsets.all(2), // Border radius
          child: ClipOval(
              child: Image.asset(
            'assets/images/yl-bg.png',
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
