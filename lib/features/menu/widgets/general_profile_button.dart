import 'package:flutter/material.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';
import 'package:task/global/widgets/general_raw_material_button.dart';

class GeneralProfileButton extends StatelessWidget {
  const GeneralProfileButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.child,
      required this.isLoading});

  final Function() onPressed;
  final String title;
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GeneralRawMaterialButton(
      onPressed: onPressed,
      height: 56,
      width: MQuery.getWidth(context, 375),
      backColor: Colors.transparent,
      borderSideWidth: 0,
      borderSideColor: Colors.transparent,
      radius: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MQuery.getWidth(context, 24)),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: isLoading ? const CircularProgressIndicator() : child,
            ),
            //SvgPicture.asset(image,height: 25,width: 25,)),
            SizedBox(
              width: MQuery.getWidth(context, 10),
            ),
            Expanded(
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),

            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
