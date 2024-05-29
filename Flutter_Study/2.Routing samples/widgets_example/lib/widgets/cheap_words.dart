import 'package:flutter/material.dart';

class CheepWords extends StatefulWidget {
  
  final List<String> repositoryText;
  final TextEditingController textEditingController;

  const CheepWords({
    Key? key,
    required this.repositoryText,
    required this.textEditingController
  }) : super(key: key);

  @override
  _CheepWordsState createState() => _CheepWordsState();
}

class _CheepWordsState extends State<CheepWords> {

  final List<String> _selectedText =[];

  @override
  Widget build(BuildContext context) {
    return  Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.repositoryText.where((e) => widget.textEditingController.text.isEmpty
                ? true
                : e.toLowerCase().contains(widget.textEditingController.text.toLowerCase())).map((e) => ChoiceChip(
                selected: _selectedText.contains(e),
                selectedColor: Colors.black,
                backgroundColor: Colors.blueGrey,
                label: Container(
                  // padding: _selectedSuppliers.contains(e) ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_selectedText.contains(e))
                      const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(Icons.check, color: Colors.blueGrey),
                      ),
                      Text(e)
                    ],
                  ),
                ),
                onSelected: (value) {
                  if (value) {
                    _selectedText.add(e);
                  } else {
                    _selectedText.remove(e);
                  }
                  setState(() {});
                },
              )).toList(),
            );
          }
        }
