import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFieldScreen extends StatefulWidget {


  static String routeName = '/_fieldsDemos/01_textfield';

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


  const TextFormFieldScreen({
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
  _TextFormFieldScreenState createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<TextFormFieldScreen> {


   @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('PasswordField'),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
                color: Colors.blue
              ),
              onChanged: widget.onChanged,
              maxLength: widget.maxLength,
              
              decoration: InputDecoration(
                alignLabelWithHint: true,
                filled: true,
                isDense: true,
                fillColor: widget.isReadOnly ? Colors.grey.shade300 : Colors.blue.withOpacity(0.10),
                labelText: widget.mandatory ? '${widget.labelText} *' : widget.labelText,
                prefixText: widget.prefix,
                hintText: widget.hint,
                helperText: widget.helperText,
                labelStyle: const TextStyle(
                  color: Colors.blueGrey
                ),
                hintStyle: const TextStyle(
                  color: Colors.blueGrey
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
          ),
        ],
      ),
    ),
  );
}