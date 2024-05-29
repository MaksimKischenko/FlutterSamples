import 'package:flutter/material.dart';

class CodeField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(FocusNode? focusNode)? onTap;

  const CodeField({this.controller, this.focusNode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        readOnly: true,
        enableInteractiveSelection: false,
        onTap: () => onTap?.call(focusNode),
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
        ),
      ),
    );
  }
}
