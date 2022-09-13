import 'package:flutter/material.dart';

class OnIconHover extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  const OnIconHover({super.key, required this.onTap, required this.child});

  @override
  State<OnIconHover> createState() => _OnIconHoverState();
}

class _OnIconHoverState extends State<OnIconHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, 4, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEnter(true),
      onExit: (event) => onEnter(false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: IconButton(
            icon: widget.child,
            onPressed: widget.onTap,
          )),
    );
  }

  onEnter(bool val) {
    setState(() {
      isHovered = val;
    });
  }
}
