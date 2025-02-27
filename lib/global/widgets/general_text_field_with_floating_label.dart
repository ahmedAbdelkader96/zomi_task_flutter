import 'package:flutter/material.dart';

class GeneralTextFieldWithFloatingLabel extends StatelessWidget {
  const GeneralTextFieldWithFloatingLabel(
      {super.key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      required this.onChanged,
      required this.validator,
         this.suffixIcon});

  final TextEditingController controller;
  final String hintText;

  final TextInputType? keyboardType;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

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
      keyboardType: keyboardType,
      cursorColor: const Color(0xFF191D2B),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      controller: controller,
      decoration: InputDecoration(
        border:  const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE8EAEE),width: 1.5)),
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE8EAEE),width: 1.5)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE8EAEE),width: 1.5)),
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF96A0B5)),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(maxHeight: 24,minHeight: 24,minWidth: 24,maxWidth: 24)

      ),
    );
  }
}
