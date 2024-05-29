import 'package:flutter/material.dart';

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({Key? key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Auto'),
        ),
        body: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _kOptions.where((String option) =>
                option.contains(textEditingValue.text.toLowerCase()));
          },
          onSelected: (String selection) {
            print('You just selected $selection');
          },
        ),
      ),
    );
  }
}
