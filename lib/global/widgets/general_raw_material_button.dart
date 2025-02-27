import 'package:flutter/material.dart';

class GeneralRawMaterialButton extends StatelessWidget {
  const GeneralRawMaterialButton(
      {super.key,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.backColor,
      required this.borderSideWidth,
      required this.borderSideColor,
      required this.radius,
      required this.child});

  final void Function() onPressed;
  final double height;
  final double width;
  final Color backColor;
  final double borderSideWidth;
  final Color borderSideColor;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints(
          minHeight: height,
          maxHeight: height,
          minWidth: width,
          maxWidth: width),
      fillColor: backColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: borderSideWidth, color: borderSideColor),
          borderRadius: BorderRadius.circular(radius)),
      child: child,
      elevation: 0,focusElevation: 0,hoverElevation: 0,highlightElevation: 0,
    );
  }
}
