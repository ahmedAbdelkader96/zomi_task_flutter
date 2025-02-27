import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: MQuery.getheight(context, 55),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: MQuery.getWidth(context, 24),
              left: MQuery.getWidth(context, 16)),
          child: Row(
            children: [
              GeneralRawMaterialButton(
                  onPressed: () {},
                  height: 40,
                  width: 40,
                  backColor: Colors.transparent,
                  borderSideWidth: 0,
                  borderSideColor: Colors.transparent,
                  radius: 4,
                  child: SvgPicture.asset('assets/images/menu.svg')),
              SizedBox(
                width: MQuery.getWidth(context, 24),
              ),
              Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF191D2B)),
                  )),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  GeneralRawMaterialButton(
                      onPressed: () {},
                      height: 40,
                      width: 40,
                      backColor: Colors.transparent,
                      borderSideWidth: 1.5,
                      borderSideColor: const Color(0xFFE8EAEE),
                      radius: 4,
                      child: SvgPicture.asset(
                        'assets/images/notification.svg',
                        height: 24,
                      )),
                  Positioned(
                      top: 8,
                      right: 8,
                      child: SvgPicture.asset(
                          'assets/images/ellipse_notification.svg'))
                ],
              ),
            ],
          ),
        ),

        SizedBox(
          height: MQuery.getheight(context, 24),
        ),
        const Divider(
          thickness: 1.5,
          color: Color(0xFFE8EAEE),
        ),

      ],
    );
  }
}
