import 'package:flutter/material.dart';



class PasswordField extends StatefulWidget {

  static String routeName = '/_fieldsDemos/02_passwordfield';

  final String labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String value)? onSaved;
  final String? Function(String)? validator;
  final Function(String value)? onChanged;
  
  const PasswordField({
    required this.labelText,
    this.initialValue,
    this.controller,
    this.onSaved,
    this.validator,
    this.onChanged
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool _passwordHidden = true;

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
              autocorrect: false,  
              obscureText:_passwordHidden,
              initialValue: widget.initialValue,
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                color: Colors.blueGrey
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _passwordHidden = !_passwordHidden),
                  icon: Icon(
                    _passwordHidden ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                alignLabelWithHint: true,
                filled: true,
                isDense: true,
                fillColor: Colors.blueGrey.withOpacity(0.03),
                labelText: widget.labelText,
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
              validator: (value) => widget.validator?.call(value!),
              onSaved: (value) => widget.onSaved?.call(value!),
              onChanged: (value) => widget.onChanged?.call(value),
            ),
          ),
        ],
      ),
    ),
  );
}