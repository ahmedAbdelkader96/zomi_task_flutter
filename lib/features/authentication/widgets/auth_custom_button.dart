import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton(
      {super.key,
      required this.onPressed,
      required this.imagePath,
      required this.title, required this.isLoading});

  final Function() onPressed;
  final String imagePath;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GeneralRawMaterialButton(
        onPressed: onPressed,
        height: 56,
        width: MQuery.getWidth(context, 327),
        backColor: Colors.transparent,
        borderSideWidth: 1.5,
        borderSideColor: const Color(0xFFE8EAEE),
        radius: MQuery.getheight(context, 8),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 16)),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Center(
                  child: isLoading? CircularProgressIndicator(): SvgPicture.asset(
                    imagePath,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 49,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191D2B)),
              )
            ],
          ),
        ));
  }
}
