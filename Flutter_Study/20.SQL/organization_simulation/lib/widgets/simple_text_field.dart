import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:organization_simulation/styles.dart';

class SimpleTextField extends StatefulWidget {
  final String labelText;
  final String? initialValue;
  final TextInputType? textInputType;
  final bool isReadOnly;
  final TextEditingController? controller;
  final bool mandatory;
  final Function(String value)? onSaved;
  final int? maxLength;
  final MaskTextInputFormatter? formatter;
  final String? prefix;
  final String? hint;
  final Function(String?)? onChanged;
  final String? Function(String)? validator;
  final String? helperText;
  final int? maxLines;


  const SimpleTextField({
    required this.labelText,
    this.initialValue,
    this.textInputType,
    this.isReadOnly = false,
    this.controller,
    this.mandatory = false,
    this.onSaved,
    this.maxLength,
    this.formatter,
    this.prefix,
    this.hint,
    this.onChanged,
    this.validator,
    this.helperText,
    this.maxLines = 1,
  });

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {


  @override
  Widget build(BuildContext context) => SizedBox(
    width: 300,
    child: TextFormField(
      controller: widget.controller,
      inputFormatters: widget.formatter != null ? [widget.formatter!] : [],
      autocorrect: false,  
      keyboardType: widget.textInputType,
      readOnly: widget.isReadOnly,
      initialValue: widget.initialValue,
      minLines: 1,
      maxLines: widget.maxLines,
      textInputAction: TextInputAction.done,
      style: const TextStyle(
        color: AppStyles.mainTextColor
      ),
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      
      decoration: InputDecoration(
        // suffixIcon: IconButton(
        //   onPressed: () => setState(() {
        //     _accountFormatter = MaskTextInputFormatter(mask: 'adm', filter: { '#': RegExp('[0-9]') });
        //   } ),
        //   icon: Icon(
        //     Icons.account_circle,
        //     size: 20,
        //     color: const Color(0xff0BB494),
        //   ),
        // ),
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        fillColor: widget.isReadOnly ? Colors.grey.shade300 : AppStyles.mainColor.withOpacity(0.03),
        labelText: widget.mandatory ? '${widget.labelText} *' : widget.labelText,
        prefixText: widget.prefix,
        hintText: widget.hint,
        helperText: widget.helperText,
        labelStyle: const TextStyle(
          color: AppStyles.mainTextColor
        ),
        hintStyle: const TextStyle(
          color: AppStyles.mainTextColor
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        )
      ),
      validator: (value) {
        if (widget.mandatory && (value?.isEmpty ?? true)) {
          return 'Поле обязательное для заполнения';
        }
        return widget.validator?.call(value!);
      },
      onSaved: (value) => widget.onSaved?.call(value!),
    ),
  );
}