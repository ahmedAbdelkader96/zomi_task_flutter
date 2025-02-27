import 'package:flutter/material.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final Function(int) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    double w = MQuery.getWidth(context, 375) / 4;
    double h = 60;

    return Container(
      height: h,
      //width: w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 30,
                spreadRadius: 2,
                offset: const Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralRawMaterialButton(
              onPressed: () => onTap(0),
              height: h,
              width: w,
              backColor: Colors.transparent,
              borderSideWidth: 0,
              borderSideColor: Colors.transparent,
              radius: 32,
              child: Icon(
                Icons.house,
                color:
                    selectedIndex == 0 ? Colors.black : const Color(0xFF697896),
              )),
          GeneralRawMaterialButton(
              onPressed: () => onTap(1),
              height: h,
              width: w,
              backColor: Colors.transparent,
              borderSideWidth: 0,
              borderSideColor: Colors.transparent,
              radius: 32,
              child: Icon(
                Icons.calendar_month_outlined,
                color:
                    selectedIndex == 1 ? Colors.black : const Color(0xFF697896),
              )),
          GeneralRawMaterialButton(
              onPressed: () => onTap(2),
              height: h,
              width: w,
              backColor: Colors.transparent,
              borderSideWidth: 0,
              borderSideColor: Colors.transparent,
              radius: 32,
              child: Icon(
                Icons.insights,
                color:
                    selectedIndex == 2 ? Colors.black : const Color(0xFF697896),
              )),
          GeneralRawMaterialButton(
              onPressed: () => onTap(3),
              height: h,
              width: w,
              backColor: Colors.transparent,
              borderSideWidth: 0,
              borderSideColor: Colors.transparent,
              radius: 32,
              child: Icon(
                Icons.person,
                color:
                    selectedIndex == 3 ? Colors.black : const Color(0xFF697896),
              )),
        ],
      ),
    );
  }
}
