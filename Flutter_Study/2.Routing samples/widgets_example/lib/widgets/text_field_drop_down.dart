import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_example/styles.dart';


class TextFieldDropdown<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T item) itemBuilder;
  final T? selected;
  final Function(T item)? onTap;
  final double width;
  final Function(T? item)? onSaved;
  final String? Function()? validator;
  final String emptyMessage;

  const TextFieldDropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.selected,
    this.onTap,
    this.width = 350,
    this.onSaved,
    this.validator,
    this.emptyMessage = 'Не выбрано'
  }) : super(key: key);

  @override
  _TextFieldDropdownState<T> createState() => _TextFieldDropdownState<T>();
}

class _TextFieldDropdownState<T> extends State<TextFieldDropdown<T>> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.selected != null) {
      _controller.text = widget.itemBuilder(widget.selected!);
    } else {
      _controller.text = widget.emptyMessage;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: widget.width,
    child: TextFormField(
      controller: _controller,
      autocorrect: false,
      readOnly: true,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        isDense: true,
        fillColor: widget.onTap == null ? Colors.grey.shade300 : AppStyles.mainColor.withOpacity(0.03),
        labelText: widget.title,
        labelStyle: const TextStyle(color: AppStyles.mainTextColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        ),
        suffix: widget.onTap != null ? PopupMenuButton<T>(
          // tooltip: widget.hintText,
          initialValue: widget.selected,
          onSelected: (value) {
            widget.onTap?.call(value);
            setState(() {
              _controller.text = widget.itemBuilder(value);
            });
          },
          //! Here is the magic ! // 
          itemBuilder: (BuildContext context) => widget.items.map<PopupMenuItem<T>>((e) => PopupMenuItem<T>(
            value: e,
            child: Text(widget.itemBuilder(e)),
          )).toList(),
          child: const Icon(
            CupertinoIcons.chevron_down,
            size: 16,
          ),
        ) : null,
      ),
      onSaved: (_) => widget.onSaved?.call(widget.selected),
      validator: (_) => widget.validator?.call(),
    ),
  );
}
