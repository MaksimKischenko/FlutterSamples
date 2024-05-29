import 'package:custom_kufar_app/styles.dart';
import 'package:flutter/material.dart';


class SearchTextField extends StatefulWidget {

  final TextEditingController controller;
  final Function(String)? onTap;  

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);


  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: AppStyles.mainColor,
      cursorWidth: 2,
      cursorHeight: 20,
      onSubmitted: widget.onTap,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: AppStyles.mainColor, width: 2),
          borderRadius: BorderRadius.circular(5)
        ),
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        //hintText: hint,
        labelStyle: const TextStyle(
          color: AppStyles.spaceColor
        ),
        hintStyle:  const TextStyle(
          color: AppStyles.spaceColor
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppStyles.mainColor, width: 2),
          borderRadius: BorderRadius.circular(5)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color: AppStyles.mainColor, width: 2),
          borderRadius: BorderRadius.circular(5)
        )
      ),
    );
  }
}