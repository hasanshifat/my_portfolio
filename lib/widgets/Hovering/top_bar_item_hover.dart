import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_web/constants/colors.dart';
import 'package:my_portfolio_web/constants/paddings.dart';
import 'package:my_portfolio_web/controller/theme_coltroller.dart';

class OnTopBarItemHover extends StatefulWidget {
  final Function() onTap;
  final String text;
  const OnTopBarItemHover({super.key, required this.onTap, required this.text});

  @override
  State<OnTopBarItemHover> createState() => _OnTopBarItemHoverState();
}

class _OnTopBarItemHoverState extends State<OnTopBarItemHover> {
  bool isHovered = false;
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -4, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: PaddingDeafult.horizontal_10),
      child: MouseRegion(
        onEnter: (event) => onEnter(true),
        onExit: (event) => onEnter(false),
        child: InkWell(
          onTap: widget.onTap,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.openSans(
                    color: isHovered
                        ? CustomColors.colorGreen
                        : CustomColors.colorBlack,
                    fontSize: 14,
                    fontWeight: isHovered ? FontWeight.w500 : FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: PaddingDeafult.vertical_5,
                ),
                AnimatedContainer(
                  transform: transform,
                  duration: const Duration(milliseconds: 500),
                  height: 2,
                  width: 50,
                  decoration: BoxDecoration(
                      color: isHovered
                          ? CustomColors.colorGreen
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onEnter(bool val) {
    setState(() {
      isHovered = val;
    });
  }
}
