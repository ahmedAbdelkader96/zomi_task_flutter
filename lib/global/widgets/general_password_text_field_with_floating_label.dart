import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GeneralPasswordTextFieldWithFloatingLabel extends StatelessWidget {
  const GeneralPasswordTextFieldWithFloatingLabel(
      {super.key,
      required this.controller,
      this.onTap,
      required this.hintText,
      this.onFieldSubmitted,
      required this.obscureText,
      required this.onChanged,
      required this.changeObsecureValue,
      required this.validator});

  final TextEditingController controller;
  final Function? onTap;
  final bool obscureText;
  final Function? onFieldSubmitted;
  final String hintText;
  final void Function(String) onChanged;
  final void Function() changeObsecureValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (pointerDownEvent) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
      toolbarOptions: const ToolbarOptions(
          copy: true, cut: true, paste: true, selectAll: true),
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191D2B)),
      onChanged: onChanged,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: const Color(0xFF191D2B),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      controller: controller,
      decoration: InputDecoration(
        border:  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE8EAEE),width: 1.5)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE8EAEE),width: 1.5)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE8EAEE),width: 1.5)),

        suffixIconConstraints: const BoxConstraints(maxWidth: 50, minWidth: 50,
        minHeight: 40,maxHeight: 40),
        suffixIcon: IconButton(
          onPressed: changeObsecureValue,
          icon: SvgPicture.asset(
            obscureText ?'assets/images/visibility_off.svg':
            'assets/images/visibility.svg' ,
            color: const Color(0xFF96A0B5),
          ),
        ),

        hintText: hintText,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF96A0B5)),
      ),
    );
  }
}
