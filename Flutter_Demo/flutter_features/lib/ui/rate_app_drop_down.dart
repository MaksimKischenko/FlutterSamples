import 'package:flutter/material.dart';
import 'package:flutter_features/extensions/build_context_extensions.dart';
import 'package:flutter_features/utils/sizes.dart';


class RateAppDropDown<T> extends StatefulWidget {
  final Map<T, String> dropdownMenuEntries;
  final Function(T? value) onSelectValue;
  const RateAppDropDown({
    super.key,
    required this.dropdownMenuEntries,
    required this.onSelectValue,
  });

  @override
  State<RateAppDropDown<T>> createState() => _RateAppDropDownState<T>();
}

class _RateAppDropDownState<T> extends State<RateAppDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    //DropdownMenu not expanding according to its parent's width :
    //https://github.com/flutter/flutter/issues/125199
    final double width = MediaQuery.of(context).size.width - KSize.margin8x;
    return DropdownMenu<T>(
      enableSearch: false,
      width: width,
      hintText: '',
      textStyle: context.textTheme.bodyLarge,
      trailingIcon: const Icon(Icons.chevron_left),
      //selectedTrailingIcon: const Icon(MtIcons.a),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: context.theme.textTheme.bodyMedium?.copyWith(
          color: context.colors.onSurfaceVariant,
        ),
        //labelStyle: context.textTheme.bodySmall,
        enabledBorder: OutlineInputBorder(
          borderRadius: KSize.defaultBorderRadius,
          borderSide: BorderSide(
            color: context.colors.background,
          ),
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: MaterialStatePropertyAll(
          context.colors.onPrimary,
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: KSize.defaultBorderRadius,
          ),
        ),
      ),
      onSelected: widget.onSelectValue,
      dropdownMenuEntries: widget.dropdownMenuEntries.values.map<DropdownMenuEntry<T>>((value) {
        return DropdownMenuEntry<T>(
          value: value as T,
          label: value,
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
        );
      }).toList(),
    );
  }
}
