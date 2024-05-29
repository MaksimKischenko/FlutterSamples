import 'package:flutter/material.dart';
import 'package:untitled1/models/models.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function(Note note) onTap;
  final Function(bool value) onCheckTap;

  NoteItem({required this.note, required this.onTap, required this.onCheckTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: note.check,
        onChanged: (value) => onCheckTap(value ?? false),
      ),
      onTap: () => onTap(note),
      title: Text(
        note.title ?? 'Пусто',
        style: TextStyle(
            decoration: note.check ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(
        note.text ?? 'Пусто',
        style: TextStyle(
            decoration: note.check ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
