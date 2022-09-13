import 'package:flutter/material.dart';

import '../Large_Screen/large_screen.dart';
import '../helpers/responsiveness.dart';
import '../widgets/Custom_Text/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> sckey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sckey,
      appBar: !ResponsiveWidget.isSmallScreen(context)
          ? null
          : topNavBar(context, sckey),
      drawer: Drawer(
          //  child: SideMenu(),
          ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: localNavigator(),
        ),
      ),
    );
  }
}
