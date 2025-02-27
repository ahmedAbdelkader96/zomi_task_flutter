import 'package:flutter/material.dart';
import 'package:task/global/methods_helpers_functions/media_query.dart';


class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onChanged});
  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(

      onChanged: onChanged,
      controller: controller,
      //initialValue: '',

      style: const TextStyle(
          fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black,decoration: TextDecoration.none
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF999999)
        ),
        contentPadding: EdgeInsets.only(left: MQuery.getWidth(context, 16), right: MQuery.getWidth(context, 16)),

        //errorText: 'Error message',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(36),borderSide: const BorderSide(width: 1,color: Color(0xFF999999))),
        //enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide(width: 1,color: Color(0xFF602465))),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(36),borderSide: const BorderSide(width: 1,color: Color(0xFF999999))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(36),borderSide: const BorderSide(width: 1,color: Color(0xFF602465))),

      ),
    );


  }
}
