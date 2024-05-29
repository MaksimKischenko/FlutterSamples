import 'package:flutter/material.dart';



class SimpleTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final bool isReadOnly;
  final TextEditingController? controller;
  final bool mandatory;
  final Function(String value)? onSaved;
  final int? maxLength;
  final String? prefix;
  final String? hint;
  final Function(String?)? onChanged;
  final String? Function(String)? validator;
  final String? helperText;
  final int? maxLines;


  const SimpleTextField({
    required this.labelText,
    this.initialValue,
    this.isReadOnly = false,
    this.controller,
    this.mandatory = false,
    this.onSaved,
    this.maxLength,
    this.prefix,
    this.hint,
    this.onChanged,
    this.validator,
    this.helperText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 350,
    child: TextFormField(
      controller: controller,
      autocorrect: false,  
      readOnly: isReadOnly,
      initialValue: initialValue,
      minLines: 1,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: Colors.blueGrey
      ),
      onChanged: onChanged,
      maxLength: maxLength,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        fillColor: isReadOnly ? Colors.grey.shade300 : Colors.grey.shade200,
        labelText: mandatory ? '$labelText *' : labelText,
        prefixText: prefix,
        hintText: hint,
        helperText: helperText,
        labelStyle: const TextStyle(
          color: Colors.blueGrey
        ),
        hintStyle: const TextStyle(
          color: Colors.blueGrey
        ),
        border: OutlineInputBorder(
          //borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        )
      ),
      validator: (value) {
        if (mandatory && (value?.isEmpty ?? true)) {
          return 'Поле обязательное для заполнения';
        }
        return validator?.call(value!);
      },
      onSaved: (value) => onSaved?.call(value!),
      
    ),
  );
}