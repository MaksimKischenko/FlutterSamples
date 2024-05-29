

import 'package:flutter/material.dart';

class Country {

  const Country({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}

const List<Country> countryOptions = <Country>[
  Country(name: 'Africa', size: 30370000),
  Country(name: 'Asia', size: 44579000),
  Country(name: 'Australia', size: 8600000),
  Country(name: 'Bulgaria', size: 110879),
  Country(name: 'Canada', size: 9984670),
  Country(name: 'Denmark', size: 42916),
  Country(name: 'Europe', size: 10180000),
  Country(name: 'India', size: 3287263),
  Country(name: 'North America', size: 24709000),
  Country(name: 'South America', size: 17840000),
];

class AutoCompleteDemo extends StatefulWidget {
  const AutoCompleteDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutoCompleteDemoState();
}

class _AutoCompleteDemoState extends State<AutoCompleteDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter AutoComplete Demo'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Autocomplete<Country>(
          //Текст которые появится в текстовом поле после выбора
          optionsBuilder: (textEditingValue) {
            return countryOptions
                .where((county) => county.name.toLowerCase().startsWith(textEditingValue.text.toLowerCase())).toList();
          },
          displayStringForOption: (option) => option.name,
          fieldViewBuilder: (
               context,
               fieldTextEditingController,
               fieldFocusNode,
               onFieldSubmitted
          ) {
            return TextField(
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
          onSelected: (selection) {
            print('Selected: ${selection.name}');
          },
          optionsViewBuilder: (
              BuildContext context,
              AutocompleteOnSelected<Country> onSelected,
              Iterable<Country> options
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Container(
                  width: 300,
                  color: Colors.cyan,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Country option = options.elementAt(index);

                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          title: Text(option.name, style: const TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}