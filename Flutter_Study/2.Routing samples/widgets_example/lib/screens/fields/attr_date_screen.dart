import 'package:flutter/material.dart';
import 'package:widgets_example/styles.dart';

import 'package:widgets_example/utils/utils.dart';

class AttrDate extends StatefulWidget {

  static String routeName = '/_fieldsDemos/03_datefield';

  final String labelText;
  final String? hintText;
  final String initialValue;
  final Function(String?)? onSaved;
  final bool editable;
  final bool mandatory;
  final String? Function()? validator;
  final Function(DateTime value)? onChange;

  const AttrDate({
    required this.labelText,
    this.hintText,
    this.initialValue = '',
    this.onSaved,
    this.editable = true,
    this.mandatory = false,
    this.validator,
    this.onChange
  });

  @override
  _AttrDateState createState() => _AttrDateState();
}

class _AttrDateState extends State<AttrDate> {

  TextEditingController? _dateController;
  
  @override
  void initState() {
    super.initState();

    _dateController = TextEditingController(text: widget.initialValue);
  }

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

          TextFormField(
            controller: _dateController,
            readOnly: true,
            style: TextStyle(
              color: widget.editable
                ? AppStyles.mainTextColor
                : AppStyles.mainTextColor.withOpacity(0.55),
            ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              isDense: true,
              fillColor: !widget.editable ? Colors.grey.shade300 : AppStyles.mainColor.withOpacity(0.03),
              labelText: widget.mandatory ? '${widget.labelText} *' : widget.labelText,
              suffixIcon: IconButton(
                onPressed: () {
                  if (widget.editable) _showDatePicker();
                },
                icon: const Icon(Icons.date_range)),
              labelStyle: const TextStyle(
                color: AppStyles.mainTextColor
              ),
              helperText: widget.hintText,
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
              if ((value?.isEmpty ?? true) && widget.mandatory) return 'Некорректная дата';
              return widget.validator?.call();
            },
            onSaved: (value) => widget.onSaved?.call(value),
          ),
        ],
      ),
    ),
  );

  //TODO: remove
  // ignore: avoid_void_async
  void _showDatePicker() async {
    final value = await showdatePicker(
      context: context,
      initialDate: _dateController?.text.toDateFormatted() ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 20000)),
      lastDate: DateTime.now().add(const Duration(days: 20000))
    );

    if (value != null) {
      final _date = DateTime(value.year, value.month, value.day);
      _dateController?.text = _date.toStringFormatted();
      widget.onChange?.call(_date);
    }
  }

   static Future<DateTime?> showdatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate
  }) => showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate
  );
}