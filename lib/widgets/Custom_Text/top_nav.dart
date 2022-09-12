import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/constants/colors.dart';

import '../../controller/theme_coltroller.dart';
import '../../helpers/responsiveness.dart';

final ThemeController themeController = Get.put(ThemeController());

PreferredSize topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    PreferredSize(
      preferredSize: !ResponsiveWidget.isSmallScreen(context)
          ? const Size.fromHeight(85.0)
          : const Size.fromHeight(50.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: !ResponsiveWidget.isSmallScreen(context)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/yl-bg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : IconButton(
                onPressed: () {
                  key.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                )),
        title: Row(
          children: [
            Text(
              'mhshifat',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        actions: [
          !ResponsiveWidget.isSmallScreen(context)
              ? ObxValue(
                  (data) => Switch(
                    value: themeController.isLightTheme.value,
                    onChanged: (val) {
                      themeController.isLightTheme.value = val;

                      Get.changeThemeMode(
                        themeController.isLightTheme.value
                            ? ThemeMode.dark
                            : ThemeMode.light,
                      );

                      themeController.saveThemeStatus();
                    },
                    activeTrackColor: CustomColors.colorPink,
                    inactiveThumbImage: const AssetImage(
                      'assets/images/sun.png',
                    ),
                    activeThumbImage:
                        const AssetImage('assets/images/moon.png'),
                  ),
                  false.obs,
                )
              : const SizedBox()
        ],
      ),
    );
